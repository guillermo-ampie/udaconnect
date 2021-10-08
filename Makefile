manifests=

start:
	vagrant up

suspend:
	vagrant suspend

stop:
	vagrant halt

ssh:
	vagrant ssh

deployment: $(wildcard deployment/*.yaml)
	kubectl apply -f deployment/

seed_db:
	sh scripts/run_db_command.sh `kubectl get pods | grep postgres | cut -d " " -f1`

setup:
	pipenv --python 3.8
	pipenv shell

install:
	@echo "This should be run inside a pipenv virtual env"
	pipenv install -r ./modules/api/requirements.txt

check-dependencies:
	@echo "This should be run inside a pipenv virtual env"
	pipenv check

clean:
	-pipenv --rm
	@echo
	@echo "To leave the pipenv shell type: exit"
