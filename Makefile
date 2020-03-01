# DIR=$(shell date +%Y%m%d)
DIR='./'
THEME='shironeri'

install:
	npm install -g @marp-team/marp-cli

init-theme:
	for file in $(shell ls theme/*scss );do scss $$file $${file%\.scss}.css; done

create:
	mkdir -p $(DIR)
	cat ./template/template.md >> $(DIR)/slide.md

server:
	if [ $(THEME) = '' ]; then marp -p -s --html ${DIR}; else marp -p -s --html --theme ./theme/$(THEME).css ${DIR};  fi

convert-pdf:
	marp $(DIR)/slide.md --pdf --allow-local-files --html --theme ./theme/$(THEME) -o outpu.pdf

run: create server
