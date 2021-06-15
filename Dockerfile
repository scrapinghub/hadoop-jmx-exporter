FROM python:3-alpine

WORKDIR /app
CMD /app/docker-run.sh
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY ./ ./
