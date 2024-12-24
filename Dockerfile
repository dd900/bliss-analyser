# Use Ubuntu as the base image
FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt-get install -y ffmpeg

RUN mkdir /app
RUN mkdir /db
RUN mkdir /music

# Copy the compiled binary into the container
COPY ./releases /app

# Set the working directory inside the container (optional)
WORKDIR /app

# Make sure the binary is executable
RUN chmod +x /app/bliss-analyser

# Add this to keep the container running
CMD ["sh", "-c", "tail -f /dev/null"]