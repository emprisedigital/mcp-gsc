FROM python:3.11-slim

WORKDIR /app
COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD sh -c 'echo "$GSC_SERVICE_ACCOUNT_JSON" > /app/service_account_credentials.json && python gsc_server.py'
