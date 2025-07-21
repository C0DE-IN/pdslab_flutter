#!/bin/bash

# Auto-deployment script for Qwik IYM app
# This script checks for git changes and deploys automatically
# Usage: 
#   bash deploy-auto.sh          # Normal check for changes
#   bash deploy-auto.sh --force  # Force deploy regardless of changes

# Source user environment if available
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi

# Check for force flag
FORCE_DEPLOY=false
if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
    FORCE_DEPLOY=true
fi

# Configuration
BUILD_DIR="/home/pdslabadmin/Documents/pdslab-flutter"
STATIC_DEPLOY_DIR="/var/www/pdslab"
LOG_FILE="/home/iymadmin/deploy.log"
APP_NAME="pdslab-website"

# Function to log with timestamp
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Change to build directory
cd "$BUILD_DIR" || {
    log_message "ERROR: Cannot access build directory: $BUILD_DIR"
    exit 1
}

log_message "Starting deployment check..."
log_message "Running as user: $(whoami)"
log_message "Current PATH: $PATH"
log_message "git location: $(which git || echo 'not found')"

if ! command -v git &> /dev/null; then
    log_message "ERROR: git not found in PATH"
    exit 1
fi

# Fetch latest changes from origin
log_message "Fetching from origin..."
git fetch origin main 2>&1 | tee -a "$LOG_FILE"

# Check if fetch was successful
if [ $? -ne 0 ]; then
    log_message "ERROR: Failed to fetch from origin"
    exit 1
fi

# Get current local and remote commit hashes
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

log_message "Local commit: $LOCAL"
log_message "Remote commit: $REMOTE"

# Debug: Show git status and current user
log_message "Current user: $(whoami)"
log_message "Current directory: $(pwd)"
log_message "Git status: $(git status --porcelain)"

# Check if there are changes or force deployment
if [ "$FORCE_DEPLOY" = true ]; then
    log_message "🚀 FORCE DEPLOYMENT initiated - bypassing git change detection!"
    DEPLOY_REASON="FORCED"
elif [ "$LOCAL" != "$REMOTE" ]; then
    log_message "🚀 Changes detected! Starting deployment process..."
    DEPLOY_REASON="CHANGES_DETECTED"
else
    DEPLOY_REASON="NO_CHANGES"
fi

log_message "Deployment reason: $DEPLOY_REASON"

if [ "$DEPLOY_REASON" != "NO_CHANGES" ]; then
    
    # Create backup of current state
    BACKUP_DIR="/home/pdslabadmin/backups/$(date +%Y%m%d_%H%M%S)"
    log_message "Creating backup at: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    
    # Backup current static files
    if [ -d "/var/www/pdslab" ]; then
        sudo cp -r /var/www/pdslab "$BACKUP_DIR/static" 2>/dev/null || log_message "Failed to backup static files"
    fi
    
    # Pull latest changes
    log_message "Pulling latest changes..."
    git pull origin main 2>&1 | tee -a "$LOG_FILE"
    
    if [ $? -ne 0 ]; then
        log_message "ERROR: Failed to pull changes"
        exit 1
    fi
    
    # Immediately copy client files after successful build
    log_message "✅ Copying files immediately..."
    if [ -d "build/web" ]; then
        
        log_message "Copying static files to /var/www/pdslab..."
        rsync -av --delete /home/pdslabadmin/Documents/pdslab_flutter/build/web/ /var/www/pdslab/
        log_message "✅ Client files deployed to /var/www/pdslab"
    else
        log_message "⚠️  No build/web directory found"
    fi
   
   # (Optional) Reload nginx if needed
sudo systemctl reload nginx

log_message "Deployment check finished."
echo "---" >> "$LOG_FILE"
