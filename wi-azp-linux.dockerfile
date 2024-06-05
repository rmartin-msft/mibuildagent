FROM ubuntu:22.04

RUN apt update
RUN apt upgrade -y
RUN apt install -y curl git jq libicu70 wget apt-transport-https gnupg2
# Install the Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# RUN echo "deb [arch=amd64,armhf,arm64 signed-by=/usr/share/keyrings/powershell.gpg] \
# https://packages.microsoft.com/ubuntu/20.04/prod focal main" \
# | tee /etc/apt/sources.list.d/powershell.list

# RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /usr/share/keyrings/powershell.gpg >/dev/null


RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
dpkg -i packages-microsoft-prod.deb && \
rm packages-microsoft-prod.deb
RUN su && apt-get update && \ 
 apt-get install -y dotnet-sdk-8.0 && \
 dotnet --list-sdks

ENV AGENT_TOOLSDIRECTORY="/azp/_work/_tool"

# uncomment the next line if you want codeQL in the pipeline
# RUN curl -sL https://raw.githubusercontent.com/microsoft/GHAzDO-Resources/main/src/agent-setup/codeql-install-ubuntu.sh | bash

RUN apt-get install powershell -y

# Also can be "linux-arm", "linux-arm64".
ENV TARGETARCH="linux-x64"

WORKDIR /azp/

COPY ./start.sh ./
RUN chmod +x ./start.sh

# RUN useradd agent
# RUN chown agent ./
# USER agent
# Another option is to run the agent as root.
ENV AGENT_ALLOW_RUNASROOT="true"

# ENTRYPOINT ./start.sh

ENTRYPOINT ["/bin/bash", "-c", "./start.sh"]