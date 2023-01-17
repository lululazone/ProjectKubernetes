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


