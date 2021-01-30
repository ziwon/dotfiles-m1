CUR_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

.SILENT:;

git-config:
	sh -c 'git config --global user.name "Yeongpil Yoon"'
	sh -c 'git config --global user.email "yngpil.yoon@gmail.com"'

all:
	./scripts/install.sh

brew:
	$(CUR_DIR)homebrew/install.sh

z-sh:
	$(CUR_DIR)zsh/install.sh

.DEFAULT_GOAL := all
