# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install required dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Add FFmpeg 5 PPA
RUN add-apt-repository ppa:savoury1/ffmpeg5

# Install FFmpeg 5 and necessary libraries
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libavutil58 \
    libavcodec58 \
    libavformat58 \
    libavfilter7 \
    libswresample3 \
    && rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir /app
RUN mkdir /db

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled binary into the container
COPY ./releases /app

# Make sure the binary is executable
RUN chmod +x /app/bliss-analyser-x86-ffmpeg5

# Keep the container running (if needed for interaction)
CMD ["sh", "-c", "tail -f /dev/null"]
