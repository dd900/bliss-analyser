# Use Ubuntu as the base image
FROM ubuntu:20.04

RUN mkdir /app
RUN mkdir /db

# Set the working directory inside the container (optional)
WORKDIR /app

# Copy the compiled binary into the container
COPY ./releases /app

# Make sure the binary is executable
RUN chmod +x /app/bliss-analyser

# Add this to keep the container running
CMD ["sh", "-c", "tail -f /dev/null"]