<h1>Docker container with Python Flask app </h1>
<img src="https://github.com/Joska99/Targil1090/blob/master/helm-flask-html.drawio.svg">

- In 'app' directory Python flask 'app.py' takes HTML files from "templates" directory
- With CI pipeline to Build and Push Docker image to DockerHub
[![CI - Build and Push Docker Image to joska99/flask-app](https://github.com/Joska99/Targil1090/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/Joska99/Targil1090/actions/workflows/docker-publish.yml)
- With Helm chart
- With CD delivery by ArgoCD


<h2>To run docker container</h2>

- Build Docker image, from root of the repository directory run this command
```bash
docker build . -t flask-app 
```
- Run Docker Container
```bash
docker run --name flask-app --rm -p 8000:5000 -t flask-app
```

- Connect to the Container on localhost:8000 or localhost:8000/home

- Push Docker image
```bash
docker tag flask-app joska99/flask-app:latest
docker push joska99/flask-app:latest
```

<h2>Run Helm</h2> 

- Create Helm Chart
```bash
helm create "helm-chart"
```
> Chart.yaml - Metadata for chart <br />
> values.yaml - Define values for chart<br />
> templates/ - Contains templates files for Kubernetes resources

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

<h2>Apply ArgoCD deploy pipeline</h2>

- Run scripts from root directory of repository to create "app", "argocd" NameSpaces and Deploy ArgoCD service and AppicationSet for deployment
```bash
. ./argocd/scripts.sh
```

- Connect to ArgoCD GUI
>argocd-service is IP for GUI accessible on port 80/443/TCP
```bash
kubectl port-forward -n argocd svc/argocd-server 8080:443
```
>User Name is Admin <br/>
>Get password
```bash
kubectl get secret argocd-initial-admin-secret -n argocd -o yaml | grep password: | awk '{print $2}' | base64 --decode
```
> "grep" to find the password line, "awk" to output second word, "base64 --decode" to decode the password