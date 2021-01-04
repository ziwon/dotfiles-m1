.SILENT:;    

git-config:
	sh -c 'git config --global user.name "Yeongpil Yoon"'
	sh -c 'git config --global user.email "yngpil.yoon@gmail.com"'

install:
	./scripts/install.sh

.DEFAULT_GOAL := install