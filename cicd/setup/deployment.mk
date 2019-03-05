
deploy:
	kubectl apply -f cicd/application/application.yaml
	ksync create --name=devcicd --reload=false --selector=app=devcicd $(pwd) /var/www

logs:
	ktail

cli:
	kubectl exec -ti $(shell kubectl get --no-headers=true pods -l app=devcicd -o custom-columns=:metadata.name) sh

sync:
	ksync watch

port-forward:
	kubectl port-forward svc/devcicd 8080

kubefwd:
	sudo -E kubefwd services
