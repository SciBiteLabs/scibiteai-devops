FROM python:3.8

RUN apt-get update && apt-get install -y cron

ADD ./utils/cleanup_files.py /cleanup_files.py
ADD ./utils/entrypoint.sh /entrypoint.sh

RUN chmod +x /cleanup_files.py /entrypoint.sh

ENV PYTHONPATH="$PYTHONPATH:/"
ENV DOCKERISED=True

ENTRYPOINT /entrypoint.sh