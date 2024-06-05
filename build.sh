#!/bin/bash

docker build -t "wi-azp-linux:latest" -t "eaststarcr.azurecr.io/wi-azp-linux:latest" -f ./wi-azp-linux.dockerfile .
docker push "eaststarcr.azurecr.io/wi-azp-linux:latest"

