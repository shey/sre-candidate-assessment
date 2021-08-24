vm:
	vagrant up app01

destroy:
	vagrant destroy app01

build:
	ansible-playbook -i inventory/vagrant playbooks/build.yml -v --diff

deploy:
	ansible-playbook --extra-vars="flask_branch=$(BRANCH)" \
		-i inventory/vagrant \
		playbooks/build.yml -vv \
		--diff --tags=deploy

disturb:
	ansible-playbook -i inventory/vagrant \
		playbooks/disturb.yml -vv --diff

