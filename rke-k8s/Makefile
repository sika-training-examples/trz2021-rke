dev-save-config:
	terraform output -raw dev-kubeconfig > kubeconfig.dev.yml

dev-add-config: dev-save-config
	cp ~/.kube/config ~/.kube/config.$$(date +%Y-%m-%d_%H-%M-%S).backup
	KUBECONFIG=kubeconfig.dev.yml:~/.kube/config kubectl config view --raw > /tmp/kubeconfig.merge.yml && cp /tmp/kubeconfig.merge.yml ~/.kube/config

dev-install-ingress:
	KUBECONFIG=kubeconfig.dev.yml kubectl apply -f https://raw.githubusercontent.com/ondrejsika/kubernetes-ingress-traefik/master/ingress-traefik.yml
