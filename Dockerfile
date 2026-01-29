# -----------------------------
# Dockerfile pentru bot Python 3.12
# -----------------------------

# Folosim imagine oficială Python 3.12 slim
FROM python:3.12-slim

# Setăm directorul de lucru în container
WORKDIR /app

# Instalăm unelte necesare pentru compilarea pachetelor (gcc, make etc.)
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    make \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiem fișierele proiectului în container
COPY . .

# Upgrade pip și instalare requirements
RUN pip install --upgrade pip && pip install -r requirements.txt

# Setăm variabile de mediu (le poți seta și în Render, dacă vrei)
# ENV TOKEN=your_token_here
# ENV WEBHOOK_URL=your_webhook_here

# Comanda default la rulare
CMD ["python", "nuke.py"]
