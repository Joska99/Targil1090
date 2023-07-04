<h1>Docker container with Python Flask app </h1>

<img src="https://github.com/Joska99/Targil1090/blob/master/helm-flask-html.drawio">

- Python flask takes HTML from "templates" directory
- With CI pipeline to Build and Push Docker image to DockerHub

[![CI - Build and Push Docker Image to joska99/flask-app](https://github.com/Joska99/Targil1090/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/Joska99/Targil1090/actions/workflows/docker-publish.yml)

1. To run docker container

- Build Docker image
```bash
docker build . -t flask-app 
```
- Run Docker Container
```bash
docker run --name flask-app --rm -p 8080:5000 -t test-flask-app
```
- Push Docker image
```bash
docker tag flask-app joska99/flask-app:0.0.1
docker push joska99/flask-app:0.0.1
```

2. Run Helm 

- Create Helm Chart
```bash
helm create "my-chart-name"
```
> Chart.yaml - Metadata for chart
> values.yaml - Define values for chart
> templates/ - Contains templates files for Kubernetes resources

- Create Helm package
```bash
helm package ./flask-chart
```
- Install Helm package
```bash
helm install flask-app  ./python-flask-chart-0.0.1.tgz
```

- Delete Helm Chart
```bash
helm delete flask-app
```
