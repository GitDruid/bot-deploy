docker build . -t galassia/bot-deploy:1.0.0 -t galassia/bot-deploy:latest

docker push galassia/bot-deploy:1.0.0
docker push galassia/bot-deploy:latest
