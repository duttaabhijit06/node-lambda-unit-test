NPM ?= npm

target:
	$(info ${HELP_MESSAGE})
	@exit 0

clean: ##=> Deletes current build environment and latest build
	$(info [*] Who needs all that anyway? Destroying environment....)
	rm -rf ./.aws-sam/

checkOSDependencies:
	npm version || grep "18" || (echo "Error: Requires NodeJS 18.x" && exit 1)

all: clean build

install: checkOSDependencies
	npm install

test: install
	npm run test

build: ##=> Same as package except that we don't create a ZIP
	source ./venv/bin/activate && sam build --use-container

deploy: 
	sam build --use-container
	sam deploy

deploy.g: 
	sam build
	sam deploy --guided

#############
#  Helpers  #
#############

define HELP_MESSAGE

	Usage: make <command>

	Commands:

	build     Build Lambda function and dependencies
	deploy.g  Deploy guided (for initial deployment)
	deploy    Deploy subsequent changes

	install   Install application and dev dependencies defined in requirements.txt
	test      Run unit test locally using mocks

	clean     Cleans up local build artifacts and environment
	delete    Delete stack from AWS

endef
