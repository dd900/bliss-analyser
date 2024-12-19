# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install any necessary dependencies
RUN apt-get update && apt-get install -y ffmpeg

RUN mkdir /app
RUN mkdir /db

# Set the working directory inside the container (optional)
WORKDIR /app

# Copy the compiled binary into the container
COPY ./releases /app

# Make sure the binary is executable
RUN chmod +x /app/bliss-analyser-x86-ffmpeg5

# Add this to keep the container running
CMD ["sh", "-c", "tail -f /dev/null"]