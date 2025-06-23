FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential libxslt-dev libxml2-dev libffi-dev libssl-dev git curl \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/searxng/searxng /app && \
    pip install --upgrade pip && \
    pip install -e .[all]

COPY settings.yml /app/searxng-docker/searxng/settings.yml

EXPOSE 8080
CMD ["python3", "searx/webapp.py"]
