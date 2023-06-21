FROM python:slim

# # Install Flask
RUN pip3 install flask

# Set working directory
WORKDIR /app

# Copy the Flask app code
COPY . .

# Run the Flask app
CMD [ "python3","-m", "flask", "run", "--host=0.0.0.0" ] 