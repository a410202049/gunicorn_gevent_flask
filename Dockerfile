FROM python:2.7

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY . ./
RUN pip install -i https://pypi.douban.com/simple/ -r requirements.txt
RUN mkdir -p /var/log/gunicorn
#CMD ["gunicorn", "app:app", "-c", "gunicorn.conf.py"]