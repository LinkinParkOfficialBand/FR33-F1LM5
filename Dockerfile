FROM python:3.11-slim-bookworm

# Set the working directory in the container
WORKDIR /app

# Install git and other dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://github.com/LinkinParkOfficialBand/FR33-F1LM5 .

# Copy config.json if needed (you can adjust this later)

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8888
EXPOSE 8888

# Run the application
CMD ["uvicorn", "run:main_app", "--host", "0.0.0.0", "--port", "8888", "--workers", "4"]
