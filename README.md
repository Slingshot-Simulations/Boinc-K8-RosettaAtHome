Boinc on Kubernetes - Rosetta@Home - Helping Fight COVID-19
===========

### Background:

Boinc is a program that is used to donate cpu cycles for charitable purposes. Boinc is put into a Docker container, and multiple copies of these containers are deployed on a Kubernetes cluster. The main files are the docker container that wraps up boinc and the bonic.yaml file that deploys the workers onto the kubernetes cluster. This example uses [Rosetta@Home](https://boinc.bakerlab.org/) which is currently performing work on COVID-19. If you want to pick another group or specific projects, feel free to edit the boinc.yaml file. 

### How to use this:

```
1. Make sure you have a kubernetes cluster setup somewhere
2. Create an account at http://boinc.bakerlab.org/rosetta/. 
3. Grab the 'weak account key' from https://boinc.bakerlab.org/rosetta/weak_auth.php and insert your key in the boinc.yml file
4. Edit the boinc.yaml file to indicate how many workers on your kubernetes cluster that you want to run
5. Start your boinc workers in your k8 clusters by running the command:
kubectl create -f boinc.yaml 
```

### How to stop the boinc workers:

Login to the pod and stop it computing work:

```
1. kubectl get pods
2. kubectl exec -it boinc-<insert-name-here> -- /bin/bash
3. boinccmd --project http://boinc.bakerlab.org/rosetta/ nomoretasks
4. Wait for the tasks to complete
5. kubectl delete deployment boinc
```

### Notes:

This is a refreshed version of the repository: https://github.com/ckleban/boinc-on-k8 and repurposed for the use of Rosetta@Home.
