# Use an official Python image as the base
FROM python:3.9-slim

# Set working directory
WORKDIR /usr/src/haystack

# Copy project files into the image
COPY . .

# Install system-level dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Expose the default API port
EXPOSE 8000

# Set default command
CMD ["python", "rest_api/application.py"]
