ProjectName := slate
ImageName := slate
VERSION ?= 0.0.1
REGISTRY := registry.onekloud.net

SHELL := /bin/bash
# some terminal color escape codes
LIGHT_GREEN := $(shell echo -e "\033[1;32m")
NC := $(shell echo -e "\033[0m") # No Color

.DEFAULT_GOAL := build

init:	
	@./init.sh
.PHONY: init

build:	
	@docker build --no-cache -t ${REGISTRY}/$(ImageName):$(VERSION) -t ${REGISTRY}/$(ImageName):latest .
.PHONY: build

build-fast:	
	@docker build -t ${REGISTRY}/$(ImageName):$(VERSION) -t ${REGISTRY}/$(ImageName):latest .
.PHONY: build-fast

push:
	docker push ${REGISTRY}/$(ImageName):$(VERSION) 
	docker push ${REGISTRY}/$(ImageName):latest
.PHONY: push

run: build
	@echo "${LIGHT_GREEN}start /$(ProjectName) in docker...${NC}"
	@docker run --rm -t ${REGISTRY}/$(ImageName):$(VERSION)
.PHONY: run

