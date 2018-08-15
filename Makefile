.PHONY: default help build upload install uninstall clean

default: help

help:  ## Prints help for targets with comments
	@grep -E '^[a-zA-Z._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:  ## Build the project to prepare for uploading
	./setup.py sdist

upload: build  ## Upload build to PyPI
	twine upload dist/*

install:  ## Install package locally
	pip install --user .

uninstall:  ## Uninstall local package
	pip uninstall pymath

clean:  ## Clean all build files
	rm -rf dist build *.egg-info
