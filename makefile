GIT_TAG := $(shell git describe --tags 2>/dev/null || echo "dev-$(shell git rev-parse HEAD | cut -c1-8)")

ADOC_FILES := $(wildcard docs/adoc/*.adoc)
HTML_FILES := $(subst adoc,html,$(addprefix docs/,$(notdir $(ADOC_FILES))))

.PHONY: default
default:
	@echo "no"

.PHONY: docs
docs: $(HTML_FILES)

.PHONY: package
package:
	@set -o pipefail \
		&& Unity \
		-projectPath ${PWD} \
		-batchmode -nographics -quit -exportPackage \
		Assets/GottaGo \
		GottaGo.$(GIT_TAG).unitypackage \
		| grep -v '\[Performance\]\|\[Subsystems\]\|\[MODES\]\|\[Licensing' \
		| grep -v '^\s\|Thread:\|##utp\|Native\|Register'

docs/%.html: docs/adoc/%.adoc
	@asciidoctor -o $@ -a revnumber=$(GIT_TAG) $<
