# alpine-ng 

nginx based on alpine 

docker run -d -p 80:80 alpine-ng 

if you need ssl , create ssl dir , put certificate and key file there and mount ssl dir, create appropriate config for ssl and mmount it also:

docker run -d -p 80:80 -p 443:443 -v ${PWD}/ssl:/etc/nginx/ssl ${PWD}/ssl.conf:/etc/nginx/conf.d/ssl.conf


