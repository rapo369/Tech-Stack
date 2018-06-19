FROM jp19214/nginx

RUN rm /etc/nginx/conf.d/default.conf
COPY frontend.conf /etc/nginx/conf.d
CMD ["nginx", "-g", "daemon off;"]
