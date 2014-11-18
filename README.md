# Deb building scripts for the vifros application.

This project holds the building scripts to generate a **.deb** package from
the [vifros](https://github.com/vifros/vifros) sources.

## Requirements

`npm` has to be installed in the system and an Internet connection needs
to be available.

## Usage

	./build-deb.sh

After that you will have a deb package in the project root, named like
`vifros_0.2.1-1_all.deb`.

## Some useful commands for the record.

To validate the deb package (it has some useless & annoying messages).

	lintian -EviIL +pedantic vifros-0.0-1.deb

To compress the changelog.

	gzip --best deb-src/usr/share/doc/vifros/changelog.Debian