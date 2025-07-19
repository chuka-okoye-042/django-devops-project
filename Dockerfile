# Use an official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory in container
WORKDIR /app

# Copy project files to container
COPY . /app/

# Install dependencies
RUN pip install --upgrade pip
RUN pip install --retries 10 --timeout 60 -r requirements.txt


# Collect static files (if needed)
RUN mkdir -p /app/static

# Expose port
EXPOSE 8000

# Run the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
