# Use a lightweight base image
FROM python:3.7-slim-buster

# Install dependencies
RUN apt-get update && apt-get install -y \
    python-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

# Copy the application code
COPY webapp_and_models /app

RUN mkdir -p /root/.streamlit/

# RUN echo "\
#     [server]\n\
#     headless = true\n\
#     port = $PORT\n\
#     enableCORS = false\n\
#     \n\" > ~/.streamlit/config.toml

# COPY config.toml /root/.streamlit/config.toml

# Set the working directory
WORKDIR /app

# Run the service
CMD ["streamlit", "run", "iris_web.py"]