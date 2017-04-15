#!/usr/bin/make -f

ifneq (,)
This makefile requires GNU Make.
endif

# force use of Bash
SHELL := /bin/bash
INTERACTIVE=true
DATA_PATH=../tifinagh-data/

.PHONY: default

default: build-all generate-all-fonts

build-all: build-latin build-api build-arabic

generate-all-fonts: generate-latin-font generate-api-font generate-arabic-font

build-latin:
	cd ${DATA_PATH} && pwd && yarn build -- --latin

build-api:
	cd ${DATA_PATH} && pwd && yarn build -- --api

build-arabic:
	cd ${DATA_PATH} && pwd && yarn build -- --arabic

generate-latin-font:
	${DATA_PATH}src/data-latin.json

generate-api-font:
	${DATA_PATH}src/data-api.json

generate-arabic-font:
	${DATA_PATH}src/data-arabic.json
