# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Add FFmpeg 5 PPA repository
RUN add-apt-repository ppa:savoury1/ffmpeg5

# Install FFmpeg and necessary libraries
RUN apt-get update && apt-get install -y libavcodec59 libavdevice59 libavfilter8 libavformat59 libsdl2-2.0-0 ffmpeg && rm -rf /var/lib/apt/lists/*

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