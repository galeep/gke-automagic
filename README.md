## **_Kubernetes Cluster with GKE and Terraform_**

This will attempt to stand up a (not yet production grade) 
Kubernetes cluster on GKE that uses persistent, pooled storage. 

After the cluster is stood up, the postcfg scripts 
can be run to install helm charts. These should ultimately 
move to ansible or a similar purpose-built tool. 

I'd prefer something like 
https://github.com/cloudnativelabs/terraform-packet-kubernetes
and 100% one-click clusters.

There's probably a better, shinier wheel out there, but I 
couldn't find it.  

## **_Requirements_**

This will need a Google Cloud project with billing enabled, 
and a service account  with Container Admin, Compute Admin 
and Storage Admin roles. The Compute, Container Engine and 
Resource Manager APIs must be enabled for your project.  

## Software Prerequisites
*   terraform
*   gcloud command line tool
*   kubectl
*   helm (installed locally, or on a VM) 

## Known issues
Many and sundry; beyond the scope of this readme. File bugs, 
Send patches. Create PRs. 

**_Basic terraform commands_**
```
terraform init 
terraform get 
```
```
    terraform apply // to create resources
    terraform plan // to show resources that will be created
    terraform show // to show resources that have been created
    terraform destroy //to destroy resources that have been created
```
