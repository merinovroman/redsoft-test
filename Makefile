U := ingprog

run:
	docker-compose up -d

run-dev:
	docker-compose -f docker-compose_dev.yml up -d

kill:
	docker-compose kill

development-setup:
	docker-compose run php make dev-setup

production-setup:
	docker-compose run php make prod-setup

test-unit:
	docker-compose -f docker-compose_dev.yml exec php make test-unit

test-behat:
	docker-compose -f docker-compose_dev.yml exec php make test-behat

test-all: test-unit test-behat

lint:
	docker-compose -f docker-compose_dev.yml exec php make lint

lint-fix:
	docker-compose -f docker-compose_dev.yml exec php make lint-fix

migrate:
	docker-compose -f docker-compose_dev.yml exec php make migrate

seeder:
	docker-compose -f docker-compose_dev.yml exec php make seeder

ansible-development-setup:
	mkdir -p tmp
	echo '' >> tmp/ansible-vault-password
	ansible-playbook ansible/development.yml -i ansible/development -vv

ansible-production-setup:
	mkdir -p tmp
	echo '' >> tmp/ansible-vault-password
	ansible-playbook ansible/production.yml -i ansible/production -vv

ansible-vaults-encrypt:
	ansible-vault encrypt ansible/production/group_vars/all/vault.yml

ansible-vaults-decrypt:
	ansible-vault decrypt ansible/production/group_vars/all/vault.yml

update-autoload:
	docker-compose run php make update-autoload

build-dev:
	docker-compose -f docker-compose_dev.yml build

build-prod:
	docker-compose build

run-deploy:
	ansible-playbook ansible/deploy.yml -i ansible/production -u $U -vv

push:
	git push origin master