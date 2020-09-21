#
# .Net Core 3.1 on Debian 10 (https://hub.docker.com/_/microsoft-dotnet-core-sdk/).
# Already contains PowerShell 7.0.3 (https://github.com/dotnet/dotnet-docker/blob/06a6fda2a56861e9e26cb42f23f7164c39f751c3/src/sdk/3.1/buster/amd64/Dockerfile).
# Additional info in case of changes in base image (https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7).
#
FROM mcr.microsoft.com/dotnet/core/sdk:3.1

LABEL maintainer="Alessandro Galasso"

# Install Azure CLI as addressed here: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest

# 1. Get packages needed for the install process
RUN apt-get update \
    && apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg

# 2. Download and install the Microsoft signing key:
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

# 3. Add the Azure CLI software repository
RUN AZ_REPO=$(lsb_release -cs) \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    tee /etc/apt/sources.list.d/azure-cli.list

# 4. Update repository information and install the azure-cli package
RUN apt-get update \
    && apt-get install azure-cli

# Start PowerShell
CMD ["/usr/bin/pwsh"]
