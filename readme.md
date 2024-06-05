# Setup Notes

Builing the docker image and pushing to the container repositiory

```
docker build -t "wi-azp-linux:latest" -t "eaststarcr.azurecr.io/wi-azp-linux:latest" -f ./wi-azp-linux.dockerfile .
```

Once the image is complete you can push to the container repository

```
docker push "eaststarcr.azurecr.io/wi-azp-linux:latest"
```

To start the container running on the AKS cluster

```
kubectl apply -f wi-agent-linux.yml
```

To check the status of the script use

```
kubectl logs wi-agent-linux
```

And finally, to delete the pod from the cluster user

```
kubectl delete -f wi-agent-linux.yml
```
