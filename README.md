<h1>Docker container with Python Flask app </h1>

<img src="https://github.com/Joska99/Targil1090/blob/master/helm-flask-html.drawio.svg">

- Python flask takes HTML from "templates" directory
- With CI pipeline to Build and Push Docker image to DockerHub

[![CI - Build and Push Docker Image to joska99/flask-app](https://github.com/Joska99/Targil1090/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/Joska99/Targil1090/actions/workflows/docker-publish.yml)

1. To run docker container

- Build Docker image, from root of the repository directory run this command
```bash
docker build . -t flask-app 
```
- Run Docker Container
```bash
docker run --name flask-app --rm -p 8080:5000 -t flask-app
```

- Connect to the Container on localhost:8080 or localhost:8080/home

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
<br />

> values.yaml - Define values for chart
<br />

> templates/ - Contains templates files for Kubernetes resources
<br />

- Create Helm package
```bash
helm package ./helm-chart
```
- Install Helm package
```bash
helm install flask-app  ./python-flask-chart-0.0.1.tgz
```

- Delete Helm Chart
```bash
helm delete flask-app
```
3. Apply ArgoCD pipeline with GitHub CI pipeline

- Run scripts from root directory of repository
```bash
. ./argocd/scripts.sh
```

- Connect to ArgoCD GUI
```bash
kubectl get svc -n argocd
```

> argocd-service is IP for UI accessible on port 80/443/TCP
```bash
kubectl port-forward -n argocd svc/argocd-server 8080:443
```

>User Name is Admin
<br/>

>Get password
```bash
kubectl get secret argocd-initial-admin-secret -n argocd -o yaml
```

>Copy encrypted password and paste to ths command
```bash
echo <YOUR_PSWD> | base64 --decode 
```

- Get Application for ArgoCD
```bash
kubectl get applicationset -n app
```