# python-production-flask-docker-demo
快速构建 生产线级别的 Nginx + Gunicorn + Flask demo

### 安装

1. 首先安装 [Docker](https://www.docker.com/).

2. clone 当前[项目](https://github.com/FirYuen/python-production-flask-docker-demo)

```bash
git clone https://github.com/FirYuen/python-production-flask-docker-demo.git

```

3. build

```bash
docker build -t flaskdockerdemo .
```

4. 运行

```bash
docker run -d -p 80:80 flaskdockerdemo
```

