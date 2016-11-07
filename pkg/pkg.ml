#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let opam =
  let nolint = [ "ounit";"oUnit" ] in
  Pkg.opam_file ~lint_deps_excluding:(Some nolint) "opam"

let () =
  Pkg.describe ~opams:[opam] "parse-argv" @@ fun c ->
  Ok [ Pkg.mllib "lib/parse-argv.mllib";
       Pkg.test  "lib_test/test";
  ]
