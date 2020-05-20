.PHONY: run build rebuild tidy tidy-pom tidy-html clean

CHEERPJFY := /home/user/Downloads/cheerpj_2.1/cheerpjfy.py

RUN := $(shell which nix-shell > /dev/null && echo 'nix-shell --pure --run ' || echo 'sh -c ')

POM_BX  := block_explorer_pom.xml
HTML_BX := $(shell find src -name "*.html")
JAVA_BX := $(shell find src -name "*.java")

POM_CJ  := cheerpjfy_pom.xml
JAVA_CJ := $(shell find src -name "*.java")

run: build
	${RUN} 'java -jar target/block_explorer.jar'

build: target/cheerpjfy.jar.js
	make target/block_explorer.jar

rebuild:
	touch *_pom.xml
	make build

target/block_explorer.jar: ${POM_BX} ${HTML_BX} ${JAVA_BX}
	${RUN} 'mvn -f ${POM_BX} install'

target/cheerpjfy.jar: target/block_explorer.jar ${POM_CJ} ${JAVA_CJ}
	${RUN} 'mvn -f ${POM_CJ} install'

%.jar.js: %.jar
	${CHEERPJFY} $<
	cp $*.jar    target/classes/public/
	cp $*.jar.js target/classes/public/
	touch ${POM_BX}

tidy: tidy-pom tidy-html

tidy-pom:
	find . -maxdepth 0 -name "*_pom.xml" -exec tidy -xml -i -m {} \;

tidy-html:
	find src/ -name "*.html" -exec tidy -i -m {} \;

clean:
	${RUN} 'mvn -f ${POM_BX} clean'

