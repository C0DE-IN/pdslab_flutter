## Make it executable:
```
chmod +x /home/pdslabadmin/deploy_auto.sh
```

## Edit your crontab:
```
crontab -e
```

## Add this line to run every 5 minutes:
```
*/5 * * * * /home/pdslabadmin/deploy_auto.sh >> /home/pdslabadmin/deploy.log 2>&1
```

## Permissions
Make sure /var/www/pdslab/ is writable by pdslabadmin.
If sudo is needed for systemctl reload nginx, add this to /etc/sudoers
```
pdslabadmin ALL=NOPASSWD: /bin/systemctl reload nginx
```