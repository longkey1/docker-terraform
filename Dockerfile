FROM hashicorp/terraform:latest

# Install shadow
RUN apk --no-cache add shadow

# Install gosu
RUN apk --no-cache add su-exec

# Make working directory
ENV WORK_DIR=/work
RUN mkdir ${WORK_DIR}

# Set Entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Confirm php version
RUN terraform -v
