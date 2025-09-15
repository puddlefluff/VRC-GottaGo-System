.PHONY: default
default:
	@echo "no"

.PHONY: docs
docs:
	@asciidoctor -o docs/readme.html README.adoc
