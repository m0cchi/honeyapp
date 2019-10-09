ROOT_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

clean-docker-image:
	docker image prune -f

build: clean-docker-image
	$(eval VERSION := $(shell docker run -it -v $(ROOT_DIR):/opt/app -w /opt/app python:3 python -c "import honeyapp.version; print(honeyapp.version.VERSION, end='')"))
	docker build -t kamochi/honeyapp:$(VERSION) .

release: build
	docker build -t kamochi/honeyapp:latest .
	git tag -a v$(VERSION) -m 'release v'$(VERSION)

init-dev: build

version:
	docker run -it -v $(ROOT_DIR):/opt/app -w /opt/app python:3 python -c "import honeyapp.version; print(honeyapp.version.VERSION)"

debug:
	docker run -it -e debug=True -e reloader=True -v $(ROOT_DIR):/opt/debug -w /opt/debug -p 18080:8080 kamochi/honeyapp:latest sh -c 'pipenv install && pipenv run python app.py'

run:
	docker run -it -p 3000:8080 kamochi/honeyapp:latest

daemon:
	docker run -d -p 3000:8080 kamochi/honeyapp:latest
