# Building HTML Specifications

This document describes how to create HTML specifications for this repo.

## Asciidoc Specification Source

Khronos recommends using [Asciidoctor](https://asciidoctor.org/) to author SPIR-V extensions.
Asciidoc is a text-based document format that is easy to store and manage in a version control system, like this GitHub repo.
For information about the Asciidoc format, please refer to the online documentation.

For most SPIR-V specifications it is easiest to copy and modify an existing SPIR-V extension specification, to ensure there are no missing sections and to have a consistent look-and-feel.

## Converting from Asciidoc to HTML

The Asciidoctor toolchain supports many output formats.
To publish an extension in this repo, generate an HTML specification.
Please refer to the online documentation to install the Asciidoctor toolchain.

Khronos maintains and publishes docker containers with the toolchain installed.
The `khronosgroup/docker-images:asciidoctor-spec` image provides the minimal tooling to convert to HTML using asciidoctor.

Most specifications in this repo were built with the older Asciidoc toolchain rather than Asciidoctor.
Please refer to the online documentation to install the Asciidoc toolchain if need be.

A recommended command line to build an HTML specification from Asciidoc source is:

```sh
$ asciidoctor --trace --safe-mode safe -b html5 -a icons=font -a data-uri -a toc2 -a toclevels=1 -o SPV_my_extension.html SPV_my_extension.asciidoc
```

The included Makefile in this repo can also be used to generate an HTML specification from Asciidoc source.
For example:

```sh
$ make SPV_my_extension.html
```

To run the same step inside the `asciidoctor-spec` docker image:

```sh
$ make docker-SPV_my_extension.html
```
