# ProjectKubernetes
## Sujet n°5 - Kubernetes via Minikube Objectifs :
- Découvrir les concepts d’orchestration de conteneurs avec Kubernetes 
- Déployer une stack LAMP via des fichiers YAML pour Kubernetes 
- Vous pouvez utiliser Minikube pour émuler une API Kubernetes 

## Équipe : 

Lucas GIRARD

Matisse DEMONTIS

Michel GARVES

_________________



## Schéma initial du déroulé du projet :

<div class="pull-right"> 
<center>
<img src="https://i.ibb.co/PtmPh72/diagramme-Kubernetes.png"/>
</center>
</div>



# Installation Steps: 

## k3s installation: 

```
curl -sfL https://get.k3s.io | sh -s - --docker
```

## Docker installation:

```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```


# Setup web app 

```
mkdir grp8devopsGIRARDGARVESDEMONTIS
```

- Copy repo into this directory

Creating a configmap for the app:

```
kubectl create configmap hello-world --from-file index.html
```

# Setup yml config file 

```
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: webapp
  annotations:
    kubernetes.io/ingress.class: "traefik"
spec:
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: webapp
            port:
              number: 80

---
apiVersion: v1
kind: Service
metadata:
  name: webapp
spec:
  ports:
    - port: 80
      protocol: TCP
  selector:
    app:  webapp

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp-nginx
spec:
  selector:
    matchLabels:
      app: webapp
  replicas: 3
  template:
    metadata:
      labels:
        app: webapp
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        volumeMounts:
        - name: webapp-volume
          mountPath: /usr/share/nginx/html
      volumes:
      - name: webapp-volume
        configMap:
          name: webapp
```


# Deploy k3s container:

```
kubectl apply -f webapp.yml
```


# Useful links: 
-https://www.jeffgeerling.com/blog/2022/quick-hello-world-http-deployment-testing-k3s-and-traefik
-https://docs.docker.com/engine/install/ubuntu/
-https://k3s.io/
-https://docs.k3s.io/networking
-https://chocolatey.org/install


