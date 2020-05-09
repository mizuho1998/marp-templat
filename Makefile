DIR=slides
FILE=file
THEME=shironeri

install:
	npm install -g @marp-team/marp-cli

init-theme:
	for file in $(shell ls theme/*scss );do scss $$file $${file%\.scss}.css; done

create:
	cat templates/template.md >> ${DIR}/${FILE}.md	

run:
	if [ -z $(THEME) ]; then marp -w -s --html ./${DIR}; else marp -w -s --html --theme ./theme/$(THEME).css ./$(DIR); fi

run-npx:
	if [ -z $(THEME) ]; then npx @marp-team/marp-cli -w -s --html ./${DIR}; else npx @marp-team/marp-cli -w -s --html --theme ./theme/$(THEME).css ./$(DIR); fi

convert-pdf:
	marp $(DIR)/slide.md --pdf --allow-local-files --html --theme ./theme/$(THEME) -o outpu.pdf

