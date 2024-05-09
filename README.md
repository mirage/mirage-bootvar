# mirage-bootvar

An OCaml library to read MirageOS unikernel boot parameters for different
targets.

This package contains the variant Mirage_bootvar.mli with the single
function `argv` which returns the array of boot parameters. Implementations
of this function for Xen, Solo5, and Unix targets are provided as well.

Since on some targets, the boot parameters are flattened to a single string,
there is no support for whitespaces.

## Installation

You can use opam to install mirage-bootvar:

`opam install mirage-bootvar`

## History

This repository originates from four git repositories:
- [parse-argv](https://github.com/mirage/parse-argv)
- [mirage-bootvar-unix](https://github.com/mirage/mirage-bootvar-unix)
- [mirage-bootvar-xen](https://github.com/mirage/mirage-bootvar-xen)
- [mirage-bootvar-solo5](https://github.com/mirage/mirage-bootvar-solo5)

In May 2024, this was consolidated into a single git repository using dune
variants.

## License

The code is licensed under the ISC license. See LICENSE.md and AUTHORS for
further information.