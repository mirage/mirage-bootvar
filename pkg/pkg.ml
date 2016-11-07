#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let () =
  Pkg.describe "mirage-bootvar-solo5" @@ fun c ->
  Ok [ Pkg.mllib "lib/mirage-bootvar-solo5.mllib"; ]
