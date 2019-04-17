FROM python:2.7

# ENV
ARG PROJ_FOLDER_NAME=gunicorn_gevent_flask
ARG PROJ_NAME=gunicorn_gevent_flask
ENV SERVER_ID container
ENV SERVICE_ID $PROJ_NAME

# set timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install python requirements.txt
ADD ./requirements.txt requirements.txt
RUN pip install -i https://pypi.douban.com/simple/ -r requirements.txt

# copy project files
COPY . /src

# create logs dir
RUN mkdir /var/log/gunicorn_gevent_flask/
RUN mkdir /var/log/gunicorn/

WORKDIR /src