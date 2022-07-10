# Nginx nginx

## Install

```bash
apt-get install nginx
cp nonapps/nginx/cpace-nginx.conf /etc/nginx/sites-enabled/cpace-nginx.conf
rm /etc/nginx/site-enabled/default 
rm /etc/nginx/site-available/default 
systemctl restart nginx

# Check to see if nginx is listening to the ports 80 and 9090
netstat -anp | grep 80
netstat -anp | grep 9090
```
