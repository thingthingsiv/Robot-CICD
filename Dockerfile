FROM python:3.10-slim

# Install OS dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    chromium-driver \
    chromium \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for running tests
RUN useradd -m -s /bin/bash robotuser

# Create directories for Chrome with proper permissions
RUN mkdir -p /tmp/chrome-profile /tmp/chrome-cache \
    && chown -R robotuser:robotuser /tmp/chrome-profile /tmp/chrome-cache

# Set env vars for headless Chrome
ENV ROBOT_BROWSER=chrome
ENV CHROME_BIN=/usr/bin/chromium
ENV PATH="/usr/lib/chromium:${PATH}"

# Install Robot and Selenium
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy tests
COPY ./tests ./tests

# Switch to non-root user
USER robotuser

# Set working directory
WORKDIR /home/robotuser

# Copy tests to user directory
COPY --chown=robotuser:robotuser ./tests ./tests

# Default command
CMD ["robot", "-d", "results", "tests/"]