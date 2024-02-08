FROM --platform=linux/amd64 alpine:latest 

# Update apk repositories and Install OpenSSL
RUN apk update && \
    apk add --no-cache openssl jq curl


# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the entrypoint script into the container at /usr/src/app
COPY entrypoint.sh .

# Make sure the script is executable
RUN chmod +x entrypoint.sh

# Specify the script to run as the entrypoint
ENTRYPOINT ["./entrypoint.sh"]

# Provide a default parameter, using GitHub's popular OIDC as an example
# You MUST include HTTP header
# Yout MUST exclude the training slash
CMD ["https://token.actions.githubusercontent.com"]