#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let () =
  Pkg.describe "parse-argv" @@ fun c ->
  Ok [ Pkg.mllib "lib/parse-argv.mllib";
       Pkg.test  "lib_test/test";
  ]
