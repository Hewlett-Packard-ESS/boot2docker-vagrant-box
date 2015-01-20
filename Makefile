#!/bin/bash
build: clean prepare
	time (packer.io build -parallel=false template.json)

virtualbox: clean prepare
	time (packer.io build -only=virtualbox-iso -parallel=false template.json)

prepare:
	time (docker build -t hp-ess/boot2docker . && docker run --rm hp-ess/boot2docker > boot2docker.iso)

clean:
	rm -rf *.iso *.box

install:
	(if [ -f "boot2docker_virtualbox.box" ]; then vagrant box remove -f hp-ess/boot2docker && vagrant box add hp-ess/boot2docker boot2docker_virtualbox.box; else echo " ==> Please run make virtualbox first!"; fi)

.PHONY: clean prepare build
