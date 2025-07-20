FROM python:3.10-slim

# Install OS dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    chromium-driver \
    chromium \
    && apt-get clean

# Set env vars for headless Chrome
ENV ROBOT_BROWSER=chrome
ENV CHROME_BIN=/usr/bin/chromium
ENV PATH="/usr/lib/chromium:${PATH}"

# Install Robot and Selenium
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy tests
COPY ./tests ./tests

# Default command
CMD ["robot", "-d", "results", "tests/"]

# ... your existing Dockerfile content ...

# Set env vars for headless Chrome with required flags to avoid session issues
ENV ROBOT_BROWSER=chrome
ENV CHROME_BIN=/usr/bin/chromium
ENV PATH="/usr/lib/chromium:${PATH}"
ENV ROBOT_CHROME_ARGUMENTS="--headless --no-sandbox --disable-dev-shm-usage --user-data-dir=/tmp/chrome-profile"

# ... rest of your Dockerfile ...
