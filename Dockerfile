# Use a specific Python base image
FROM python:3.11-slim

# Install Poetry
RUN pip install poetry==1.6.1

# Disable virtual environments as we're using Docker
RUN poetry config virtualenvs.create false

# Set the working directory in the Docker image
WORKDIR /code

# Copy the entire project into the Docker image
COPY . .

# Install dependencies from the poetry lock file
RUN poetry install --no-interaction --no-ansi

# Expose the port the app runs on
EXPOSE 8080

# Command to run the app using uvicorn
CMD ["uvicorn", "my-app/app.server:app", "--host", "0.0.0.0", "--port", "8080"]
