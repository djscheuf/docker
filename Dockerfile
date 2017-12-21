#
# Impyrio Dockerfile
#
FROM alpine
LABEL author="Patrick Kohler"

# Arguments
ARG GIT_REPO=https://github.com/impyrio/fountainhead.impyr.io.git

# Copy core files
COPY root /

# Install dependencies
RUN apk add --update git nginx nodejs

# Create Archon folder
RUN mkdir -p /app/archon

# Get current state
RUN git clone "$GIT_REPO" /app/archon

# Archon Security
RUN addgroup -S g_archon
RUN adduser -h /app/archon -SHD archon g_archon

# Enable chron jobs
RUN rc-service crond start && rc-update add crond
RUN run-parts /etc/periodic/daily

RUN nginx &

USER archon

CMD npm start

# Expose ports.
EXPOSE 80
EXPOSE 443