# pdslab

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## command to convert images to webp
sudo apt-get install webp

for file in *.jpg *.jpeg *.png; do cwebp "$file" -o "${file%.*}.webp"; done

## server config 
For Nginx, add the following configuration to your server block in nginx.conf or your site configuration file:

```nginx
server {
    listen 80;
    server_name pdslab.biochem.iisc.ac.in;
    root /path/to/your/flutter/web/app;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
        add_header Cache-Control "no-cache";
    }

    # Optional: Configure caching for static assets
    location /assets {
        expires 1y;
        add_header Cache-Control "public, no-transform";
    }

    # Optional: Configure caching for Flutter-specific files
    location /flutter_service_worker.js {
        expires 0;
        add_header Cache-Control "no-cache";
    }

    location /main.dart.js {
        expires 0;
        add_header Cache-Control "no-cache";
    }
}
