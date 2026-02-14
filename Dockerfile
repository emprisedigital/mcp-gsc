FROM python:3.12-slim
RUN pip install uv
WORKDIR /app
COPY . .
RUN uv venv .venv && . .venv/bin/activate && uv pip install -r requirements.txt
EXPOSE 8080
CMD sh -c 'echo "$GSC_SERVICE_ACCOUNT_JSON" > /app/service_account_credentials.json && .venv/bin/python gsc_server.py'
