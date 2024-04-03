# Copyright (c) 2023 The Khronos Group Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ASCIIDOC ?= asciidoctor
DOS2UNIX ?= dos2unix

# Compute the absolute directory name from the location of this Makefile
# so that we can compile from anywhere even if we use make -f
# <this_makefile>:
SPIRV_DIR := $(abspath $(dir $(firstword $(MAKEFILE_LIST))))


ASCIIDOC_HTML_OPTIONS = --trace \
  -b html5 \
  -a icons=font \
  -a data-uri \
  -a stylesdir=$(SPIRV_DIR)/resources \
  -a stylesheet=spirv.css \
  -a toc2 \
  -a toclevels=1

SRC_ASCIIDOC = $(wildcard extensions/*/*.asciidoc)
DST_HTML = $(SRC_ASCIIDOC:.asciidoc=.html)

all: $(DST_HTML)


# Define shorthand rules (skip the path to the extension document)
# Useful to use make docker-extension.html (docker-extensions/KHR/ext.html doesn't work)
define SHORTHAND_RULE
$(1): $(2)
endef

$(foreach file, $(DST_HTML), $(eval $(call SHORTHAND_RULE,$(notdir $(file)),$(file))))

%.html: %.asciidoc
	$(ASCIIDOC) $(ASCIIDOC_HTML_OPTIONS) -o $@ $<
	$(DOS2UNIX) $@


# Expose docker-TARGET to forward a TARGET inside a Docker container.
# For example:
#   make docker-clean docker-html docker-pdf
# Also useful to have a shell inside docker:
#   make docker-bash
#
# Run with current user and group id the published AsciiDoctor
# capable Khronos docker image.
# Re-set MAKEFLAGS to pass variables to the inner make since
# variables are dropped by docker.
docker-%:
	docker run --user `id --user`:`id --group` \
	  --interactive --tty --rm \
	  --volume $(SPIRV_DIR):/spirv khronosgroup/docker-images:asciidoctor-spec \
	  $(MAKE) MAKEFLAGS="$(MAKEFLAGS)" --directory=/spirv $*
