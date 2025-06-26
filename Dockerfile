FROM python:3.9-slim

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

## Set the working directory to where app.py is located
#WORKDIR /app

# Expose the port Streamlit runs on
EXPOSE 8501

# Command to run the application
CMD ["streamlit", "run", "app/app.py", "--server.address=0.0.0.0"]
