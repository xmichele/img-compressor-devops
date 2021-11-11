Prerequirements: Docker, docker-compose, kubernetes, helm
On Windows: Just install docker-desktop, enable Kubernetes on config GUI, run linux commands on wsl
Tested on:  Docker version 20.10.2, docker-compose version 1.27.4, kubectl v1.19.3, helm 3.5.4

TASK1: docker-compose up -d --build in project root

TASK2:
#first test with kubectl port-forward <pod> <port>
Then:
https://www.michaelrose.dev/posts/k8s-ingress-docker-desktop/
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.40.2/deploy/static/provider/cloud/deploy.yaml

TO APPLY: helm template test . -f values.yaml -f values/dev.yaml --set fullnameOverride=test | kubectl apply -f -
TO DELETE: helm template test . -f values.yaml -f values/dev.yaml --set fullnameOverride=test | kubectl delete -f -

After adding kubernetes.docker.internal to Windows etc/hosts you can reach the app at: http://kubernetes.docker.internal/image-compressor

TASK3:
wget https://raw.githubusercontent.com/aws/aws-codebuild-docker-images/master/local_builds/codebuild_build.sh
chmod +x codebuild_build.sh
./codebuild_build.sh -c -i amazon/aws-codebuild-local -b codebuild/build_w_docker.yaml -a output

Options:
    -c – passes in AWS configuration & credentials from the local host.Needed if buildspec.yml needs access to your AWS resources
    -b – to specify buildspec.yml location (current dir @default)
    -e – if you want to specify env variables file
	-a - output directory

For ECR registry and codebuild project creation please init and apply with Terraform files in <root-prj>/terraform

For codebuild required permissions please find them here:
https://docs.aws.amazon.com/codebuild/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html