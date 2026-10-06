FROM nginx:1.27-alpine

COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY nginx/proxy_params /etc/nginx/proxy_params
COPY index.html theme-editor.html style-editor.html /usr/share/nginx/html/

ENV API_UPSTREAM=http://vietnam-vector-api:3008
ENV NGINX_ENVSUBST_FILTER=^API_UPSTREAM$
EXPOSE 80
