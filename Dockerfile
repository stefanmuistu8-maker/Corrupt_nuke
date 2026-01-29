# Python 3.12
FROM python:3.12-slim

# Instalăm build tools necesare pentru aiohttp
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Setăm directorul de lucru
WORKDIR /app

# Copiem fișierele
COPY . .

# Instalăm dependințele
RUN pip install --upgrade pip && pip install -r requirements.txt

# Pornim botul
CMD ["python", "nuke.py"]
