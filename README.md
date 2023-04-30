# flexion-challenge
DevOps Challenge 2.0

The app is accessed via an HTTP L7 loadbalancer managed by GKE.

App Links:
- http://35.190.114.12/
- http://35.190.114.12/details
- http://35.190.114.12/health

## VPC
The VPC network consists of one network, `node-network`. This is the primary network which GKE will allocate IPs to provision nodes. 

The `node-network` consists of secondary ranges `services-subnet` and  `pod-subnet`. As the names suggest, are used for GKE IP allocation for services and pods. 

A cloud router and cloud nat were provisioned to allow private nodes on the `node-network` to access the internet for updates, etc.

Minimal firewall rules were created:
- `allow-ssh` allows ssh via Google Cloud ssh console
- `allow-internal` allows all internal traffic for compute instances on the `node-network`
- `l7-lb` allows health checks from Google's cidr of loadbalancers over 80 and 8080. Needed to provision HTTP loadbalancers. 

## Private VPC Native GKE
The GKE cluster is provisioned to be multi-zonal in the us-central1 region. This allows for redundant kubernetes master nodes for high availablilty. 

Worker Nodes are provisioned in 3 separate zones for redundancy. Worker nodes are only allocated a private IP address on the `node-network` and use the containerd runtime as opposed to docker. 

## IaC
Terraform file are located in the IaC directory. Statefile stored in a private Google Bucket with versioning enabled for recovery.  
To contribute, run the following IF you have IAM permission to Google Cloud:

Inititalize the backend
```
terraform init
```

After modifying terraform files, run
```
terraform fmt
```

Validate files
```
terraform validate
```

Run plan
```
terraform plan
```

Apply changes
```
terraform apply
```

## Deploy
Github Actions is used to build and deploy the hello world app to GKE.

The workflow
- Checkkouts the main branch
- Downloads and authorized gcloud to publish to container registry
- Builds and deploys new docker image to container registry
- Authorizes to GKE for deployment
- Updates image tag via kubectl

Deployment workflow is found in `.github/workflows/workflow.yaml`

## Improvements
- Create a separate repo for IaC code and integrate it's own pipeline.
- GitHub actions deploy via kustomize or helm. This was my fist time using GitHub Actions.
- GitHub actions whitelist for authorized networks. Constantly changes.
- Create Service Accounts via Terraform.
- Add testing stage for python code. 
- Add vulnerability scanning in container registry.