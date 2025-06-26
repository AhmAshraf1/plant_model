FROM python:alpine

WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code and necessary directories
COPY app/ ./app/
COPY model/ ./model/
COPY app-images/ ./app-images/
# COPY . .

# Expose the port Streamlit runs on
EXPOSE 8501

# Command to run the application
# Using --server.address=0.0.0.0 is necessary for Docker containers
# 0.0.0.0 binds to all network interfaces, making the app accessible from outside the container
# localhost or 127.0.0.1 would only allow connections from within the container itself
CMD ["streamlit", "run", "app/app.py", "--server.address=0.0.0.0"]
