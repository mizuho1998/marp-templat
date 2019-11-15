DIR=$(shell date +%Y%m%d)
THEME='shironeri'

install:
	npm install -g @marp-team/marp-cli

init-theme:
	for file in $( ls . );do scss theme/$$file theme/$${file%\.scss}.css; done

create:
	mkdir -p $(DIR)
	cat ./template/template.md >> $(DIR)/slide.md

server:
	if [ $(THEME) = '' ]; then marp -p -s --html ./${DIR}; else marp -p -s --html --theme ./theme/      $(THEME).css ./${DIR};  fi

run: create server
