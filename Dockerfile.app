FROM python:latest
RUN apt-get update
RUN git clone https://github.com/line/line-bot-sdk-python.git
WORKDIR "line-bot-sdk-python/"
RUN pip install pytest-aiohttp
RUN python3 -m pip install responses
RUN python3 setup.py install

