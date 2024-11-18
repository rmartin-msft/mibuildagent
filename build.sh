#!/bin/bash

docker build -t "wi-azp-linux:latest" -t "myacr.azurecr.io/wi-azp-linux:latest" -f ./wi-azp-linux.dockerfile .
docker push "myacr.azurecr.io/wi-azp-linux:latest"

