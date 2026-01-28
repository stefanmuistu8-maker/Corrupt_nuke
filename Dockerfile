# Folosim Python 3.12 oficial
FROM python:3.12-slim

# Setăm directorul de lucru în container
WORKDIR /app

# Copiem fișierele proiectului
COPY . .

# Upgrade pip și instalare requirements
RUN pip install --upgrade pip && pip install -r requirements.txt

# Comanda default la rulare
CMD ["python", "nuke.py"]
