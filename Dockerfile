# Use Ubuntu as the base image
FROM ubuntu:20.04

# Add FFmpeg 5 PPA repository
RUN add-apt-repository ppa:savoury1/ffmpeg5
RUN add-apt-repository ppa:savoury1/ffmpeg4

# Install FFmpeg and necessary libraries
RUN apt-get update && apt-get -y full-upgrade && rm -rf /var/lib/apt/lists/*

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