FROM python:3.9.2-alpine3.13

WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY ./ ./

CMD /app/docker-run.sh