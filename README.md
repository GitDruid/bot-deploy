# Docker Bot-Deploy

A Docker image for botframework bot deployment.

## Building the bot-deploy container

See the ./build.ps1 PowerShell command.

## Deploying a bot

    docker run --rm -it galassia/bot-deploy YOUR-COMMAND

### Example

    cd MyBotSolution
    docker run --rm -it galassia/bot-deploy ./MyBotProject/Deployment/Scripts/publish.ps1 -name BOT_NAME -resourceGroup RESOURCE_GROUP
