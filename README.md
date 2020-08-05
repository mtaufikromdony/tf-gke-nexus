# Nexus
Sonatype Nexus Repository Manager with Nexus Blobstore Google Cloud plugin

The objective is to run a Nexus application on GCP Kubernetes that can save the uploaded artifacts in Cloud Storage

## Requirements

- Enable Container Registry, Kubernetes Engine, and Cloud Resource Manager API
- [Docker](https://docs.docker.com/get-docker/)
- [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) create the Cloud Storage Bucket and the Kubernetes Cluster 
- (Optional) Separate bucket should exist to store Terraform state
- [gcloud command-line tool](https://cloud.google.com/sdk/docs/quickstarts) for interacting with Google Cloud products and services
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) for interacting with k8s cluster
- [helm](https://helm.sh/docs/intro/install/) cli to install nexus chart

## Setup

1. Create new project in GCP
2. Git clone repository
```bash
git clone https://github.com/mtaufikromdony/tf-gke-nexus.git
```
3. Enable Container Registry, Kubernetes Engine, and Cloud Resource Manager API using gcloud command-line tool
```bash
gcloud services enable compute.googleapis.com
gcloud services enable servicenetworking.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable container.googleapis.com
```
4. Build and push custom docker image to Container Registry
```bash
docker build -t asia.gcr.io/gcp-project/nexus3-gcp:0.1 .
docker push asia.gcr.io/gcp-project/nexus3-gcp:0.1
```
5. Navigate to `terraform` directory, review/update reguired values in `variables.tf`

6. Run `terraform init && terraform plan`. Review plan then apply by `terraform apply -auto-approve`
7. Get credentials for newly created cluster:

```bash
gcloud container clusters get-credentials cluster-name --region region --project project-id
```

8. Update helm values `003-Kubernetes/nexus/values.yaml` with actual repo and tag:

```yaml
image:
  repository: asia.gcr.io/project-id/nexus3-gcp
  tag: "0.1"
```

