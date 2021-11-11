helm template test . -f values.yaml -f values/dev.yaml --set fullnameOverride=test

helm template test . -f values.yaml -f values/dev.yaml --set fullnameOverride=test | kubectl apply -f -
helm template test . -f values.yaml -f values/dev.yaml --set fullnameOverride=test | kubectl delete -f -
kubectl port-forward <pod> <port>

https://www.michaelrose.dev/posts/k8s-ingress-docker-desktop/
https://github.com/kubernetes/ingress-nginx/issues/7686
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.40.2/deploy/static/provider/cloud/deploy.yaml

http://kubernetes.docker.internal/image-compressor

wget https://raw.githubusercontent.com/aws/aws-codebuild-docker-images/master/local_builds/codebuild_build.sh
chmod +x codebuild_build.sh
./codebuild_build.sh -c -i amazon/aws-codebuild-local -b codebuild/build_w_docker.yaml -a output

The following two options are the ones I found most useful:
    -c – passes in AWS configuration and credentials from the local host. Super useful if your buildspec.yml needs access to your AWS resources (most likely it will).
    -b – use a buildspec.yml file elsewhere. By default the script will look for buildspec.yml in the current directory. Override with this option.
    -e – specify a file to use as environment variable mappings to pass in.
	-a - output directory