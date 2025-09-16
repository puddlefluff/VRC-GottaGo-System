GIT_TAG := $(shell git describe --tags 2>/dev/null || echo "dev-$(shell git rev-parse HEAD | cut -c1-8)")

.PHONY: default
default:
	@echo "no"

.PHONY: docs
docs:
	@asciidoctor -o docs/readme.html README.adoc

.PHONY: package
package:
	@set -o pipefail \
		&& Unity \
		-projectPath ${PWD} \
		-batchmode -nographics -quit -exportPackage \
		Assets/Bladder \
		Assets/Prefabs \
		GottaGo.$(GIT_TAG).unitypackage \
		| grep -v '\[Performance\]\|\[Subsystems\]\|\[MODES\]\|\[Licensing' \
		| grep -v '^\s'
