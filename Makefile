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

ASCIIDOC ?= asciidoc
DOS2UNIX ?= dos2unix

SRC_ASCIIDOC = $(wildcard extensions/*/*.asciidoc)
DST_HTML = $(SRC_ASCIIDOC:.asciidoc=.html)

all: $(DST_HTML)

%.html: %.asciidoc
	$(ASCIIDOC) -b html5 -a icons -a toc2 -a toclevels=1 -o $@ $<
	$(DOS2UNIX) $@
