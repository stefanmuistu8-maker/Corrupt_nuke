# Python 3.12
FROM python:3.12-slim

# Instalăm dependințe necesare pentru build (gcc, etc.)
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Director de lucru
WORKDIR /app

# Copiem fișierele
COPY . .

# Upgrade pip + instalare pachete
RUN pip install --upgrade pip && pip install -r requirements.txt

# Pornim botul
CMD ["python", "nuke.py"]
