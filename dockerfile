FROM mcr.microsoft.com/dotnet/sdk:6.0.403-alpine3.16 as development

# Create a new user and group with non-root access
ARG USERNAME=dotnetuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN addgroup -S $USER_GID \
 && adduser -S $USERNAME -G $USER_GID \
 && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
 && chmod 0440 /etc/sudoers.d/$USERNAME \

# Set the user as the default user for the container
USER $USERNAME
WORKDIR /home/$USERNAME

# Install sudo
RUN sudo apk update && sudo apk add sudo

# Install additional dependencies as needed
# RUN sudo apk add <package-name>

# Set environment variables as needed
# ENV <key>=<value>

# Optionally, you can copy your dotnet project files to the container
# COPY . .

# Run any additional setup commands
# RUN <command>

# Start a shell session as the non-root user
# CMD ["/bin/sh"]
