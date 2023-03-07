# Building HTML Specifications

This document describes how to create HTML specifications for this repo.

## Asciidoc Specification Source

Khronos recommends using [Asciidoc](https://asciidoc-py.github.io/index.html) to author SPIR-V extensions.
Asciidoc is a text-based document format that is easy to store and manage in a version control system, like this GitHub repo.
For information about the Asciidoc format, please refer to the online documentation.

For most SPIR-V specifications it is usually easiest to copy and modify an existing SPIR-V extension specification, to ensure there are no missing sections and to have a consistent look-and-feel.

## Converting from Asciidoc to HTML

The Asciidoc toolchain supports many output formats.
To publish an extension in this repo, generate an HTML specification.

Most specifications in this repo are built with the older Asciidoc toolchain.
Please refer to the online documentation to install the Asciidoc toolchain.

A recommended command line to build an HTML specification from Asciidoc source is:

```sh
$ asciidoc -b html5 -a icons -a toc2 -a toclevels=1 -o SPV_my_extension.html SPV_my_extension.asciidoc
```

The included Makefile in this repo can also be used to generate an HTML specification from Asciidoc source.
