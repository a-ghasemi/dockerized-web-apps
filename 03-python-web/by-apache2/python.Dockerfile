FROM python:3.10

WORKDIR /
COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

VOLUME [ "/app" ]
WORKDIR /app

ENTRYPOINT [ "python3" ]
CMD [ "app.py" ]

