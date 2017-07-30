#!/usr/bin/make -f

ifneq (,)
This makefile requires GNU Make.
endif

# force use of Bash
SHELL := /bin/bash
INTERACTIVE=true
LANGUAGE_DATA_DIR=./data
FONT_CREATOR_PATH=../

.PHONY: default

default: build-all generate-all-fonts

build-all: build-latin build-api build-arabic

generate-all-fonts: generate-latin-font generate-api-font generate-arabic-font

build-latin:
	cd ${LANGUAGE_DATA_DIR} && yarn build -- --latin

build-api:
	cd ${LANGUAGE_DATA_DIR} && yarn build -- --api

build-arabic:
	cd ${LANGUAGE_DATA_DIR} && yarn build -- --arabic

generate-latin-font: reset
	cd ${FONT_CREATOR_PATH} \
	&& pwd && yarn build -- \
		--config ./config/top.tifinagh.js \
		--data ${LANGUAGE_DATA_DIR}/src/data-latin.json \
		--font-name RFC-Tifinagh-latin-regular

generate-api-font: reset
	cd ${FONT_CREATOR_PATH} \
	&& pwd && yarn build -- \
		--config ./config/top.tifinagh.js \
		--data ${LANGUAGE_DATA_DIR}/src/data-API.json \
		--font-name RFC-Tifinagh-API-regular

generate-arabic-font: reset
	cd ${FONT_CREATOR_PATH} \
	&& pwd && yarn build -- \
		--config ./config/top.tifinagh.js \
		--data ${LANGUAGE_DATA_DIR}/src/data-arabic.json \
		--font-name RFC-Tifinagh-arabic-regular

reset:
	rm ${FONT_CREATOR_PATH}/build/svg --recursive --force
