#
# Impyrio Dockerfile
#
FROM alpine
MAINTAINER Patrick Kohler

# Arguments
ARG GIT_REPO=https://github.com/impyrio/archon-placeholder.git

# Install Git & NodeJS
RUN apk add --update git nginx nodejs

# Copy core files
COPY root /

# Create Archon folder
RUN mkdir -p /app/archon && cd /app/archon
RUN git clone $GIT_REPO .

# Archon Security
RUN addgroup -S g_archon
RUN adduser -h /app/archon -SHD archon g_archon

RUN nginx &

USER archon

CMD npm start

# Expose ports.
EXPOSE 80
EXPOSE 443