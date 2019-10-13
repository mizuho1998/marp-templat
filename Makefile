DIR=$(shell date +%Y%m%d)
THEME='shironezumi'

install:
	npm install -g @marp-team/marp-cli

init-theme:
	for file in $( ls . );do scss theme/$$file theme/$${file%\.scss}.css; done

create:
	mkdir -p $(DIR)
	cat ./template/template.md >> $(DIR)/slide.md

server:
	marp -p -s --html --theme ./theme/$(THEME).css ./${DIR};

run: create server

