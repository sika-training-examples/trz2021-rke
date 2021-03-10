fmt:
	terraform fmt -recursive

fmt-check:
	terraform fmt -recursive -check

setup-git-hooks:
	rm -rf .git/hooks
	(cd .git && ln -s ../.git-hooks hooks)

GITLAB_DOMAIN=gitlab.sikademo.com
GITLAB_PROJECT_ID=160

generic-tf-init:
	@[ "$(GITLAB_USERNAME)" ] || ( echo "var GITLAB_USERNAME is not set"; exit 1 )
	@[ "$(GITLAB_PERSONAL_ACCESS_TOKEN)" ] || ( echo "var GITLAB_PERSONAL_ACCESS_TOKEN is not set"; exit 1 )

	cd $(WORKSPACE) && terraform init \
		-backend-config="address=https://$(GITLAB_DOMAIN)/api/v4/projects/$(GITLAB_PROJECT_ID)/terraform/state/$(WORKSPACE)" \
		-backend-config="lock_address=https://$(GITLAB_DOMAIN)/api/v4/projects/$(GITLAB_PROJECT_ID)/terraform/state/$(WORKSPACE)/lock" \
		-backend-config="unlock_address=https://$(GITLAB_DOMAIN)/api/v4/projects/$(GITLAB_PROJECT_ID)/terraform/state/$(WORKSPACE)/lock" \
		-backend-config="username=$(GITLAB_USERNAME)" \
		-backend-config="password=$(GITLAB_PERSONAL_ACCESS_TOKEN)" \
		-backend-config="lock_method=POST" \
		-backend-config="unlock_method=DELETE" \
		-backend-config="retry_wait_min=5"

tf-init:
	make generic-tf-init WORKSPACE=rke-cluster
