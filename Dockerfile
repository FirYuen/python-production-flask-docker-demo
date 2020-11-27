FROM python:3-alpine
WORKDIR /app

# Install nginx
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache nginx

# Setup nginx
RUN mkdir -p /run/nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY conf/flask.conf /etc/nginx/conf.d/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Install supervisord and supervisor 
RUN pip install -i https://mirrors.aliyun.com/pypi/simple --no-cache-dir gunicorn supervisor 

# Setup supervisord
RUN mkdir -p /var/log/supervisor /etc/supervisor/conf.d/
COPY conf/supervisord.conf /etc/supervisor/supervisord.conf
COPY conf/supervisord_nginx.conf /etc/supervisor/conf.d/nginx.conf
COPY conf/supervisord_gunicorn.conf /etc/supervisor/conf.d/gunicorn.conf

# expose port
EXPOSE 80

COPY app/requirements.txt .
RUN pip install -i https://mirrors.aliyun.com/pypi/simple --no-cache-dir -r /app/requirements.txt

COPY app .

# Start processes
CMD ["supervisord","--configuration", "/etc/supervisor/supervisord.conf"]
