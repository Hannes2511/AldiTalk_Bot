# Dockerfile for Hannes2511/AldiTalk_Bot

FROM python:3.8-slim

# Set work directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install playwright requests

RUN playwright install-deps

RUN playwright install

COPY at-extender.py .
COPY config.json .
COPY version.txt .

RUN chmod +x at-extender.py

# Set default command
CMD ["python", "at-extender.py"]