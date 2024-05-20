## v1.0.1 2024-05-20

* Prefix all modules (backend / parse_argv) with Mirage_bootvar to avoid
  potential conflicts (#2 @hannesm) -- observed while building
  qubes-mirage-firewall which also depends on mirage-net-xen which provides
  a module named Backend.

## v1.0.0 2024-05-16

* parse-argv, mirage-bootvar-unix, mirage-bootvar-solo5, and mirage-bootvar-xen
  have been merged into the single mirage-bootvar package. This uses dune
  variants to select the concrete implementation. The selection is done by
  the mirage tool which inspects the "target" option in `mirage configure`
  and outputs the desired ocamlfind sublibrary into the dune.build file.
* The main logic is provided by the Mirage_bootvar module, while the
  implementation to retrieve the boot parameters is provided by the dune variant
  backend, and implemented by mirage-bootvar.unix, mirage-bootvar.solo5, and
  mirage-bootvar.xen #1

## v0.3.0 (parse-argv) 2023-05-22

* remove build directive on dune dependency (mirage/parse-argv#8 @CraigFE)
* remove astring dependency, simplify code (mirage/parse-argv#10 @hannesm)

## v0.8.0 (mirage-bootvar-xen) 2020-10-21

* Adapt to mirage-xen 6.0.0 changes (Solo5 based Xen PVH, mirage/mirage-bootvar-xen#45 @mato)

## v0.7.0 (mirage-bootvar-xen) 2019-11-01

* Adapt to mirage-xen 5.0.0 changes (mirage/mirage-bootvar-xen#42 @dinosaure)
* Require OCaml 4.06.0 now (mirage/mirage-bootvar-xen#43 @hannesm)

## v0.6.0 (mirage-bootvar-solo5) 2019-09-24

* Bump version number and dependencies to stay in sync with other Mirage/Solo5
  components.
* Update Travis Matrix, bump to Ubuntu Xenial, only test with last three
  compiler versions.
* Port to dune (mirage/mirage-bootvar-solo5#13, @pascutto)

## v0.6.0 (mirage-bootvar-xen) 2019-06-17

* Port to dune from jbuilder (mirage/mirage-bootvar-xen#38 @TheLortex @avsm)
* Adapt to mirage-xen 4.0.0 `Os_xen` interface (mirage/mirage-bootvar-xen#37 @TheLortex)
* Update Travis to test 4.06 as well (@avsm).

## v0.2.0 (parse-argv) 2019-03-29

* port to dune (mirage/parse-argv#7 @hannesm)
* do not use the Result module any more (mirage/parse-argv#5 @hannesm)
* update to opam 2 metadata (mirage/parse-argv#7 @hannesm)

## 0.1.0 (mirage-bootvar-unix) 2018-10-29

Initial release

## v0.3.0 (mirage-bootvar-solo5) 2018-06-17

* Adapt to Solo5 v0.3.0 APIs.

## v0.1.0 (parse-argv) 2017-07-13

* Port to Jbuilder

## v0.5.0 (mirage-bootvar-xen) 2017-07-12

* Port to jbuilder and modernise test matrix.

## v0.4.0 (mirage-bootvar-xen) 2017-01-20

* Remove examples directory, as the module is now directly used by the mirage front-end tool.
* Add an optional `filter` parameter to `argv`, allowing users to only pass those arguments which cmdliner might expect to see.
* Convert to topkg.
* Change name to mirage-bootvar-xen from mirage-bootvar.
* Move argv parsing to external library `parse_argv` and depend on that library.
* Build against MirageOS version 3, and drop support for earlier MirageOS versions.

## v0.2.0 (mirage-bootvar-solo5) 2017-01-17

* Port to topkg (@hannesm, mirage/mirage-bootvar-solo5#6)
* Use common parse-argv library (@yomimono, mirage/mirage-bootvar-solo5#4)

## v0.0.3 (parse-argv) 2016-11-07

* Compile using `debug`to get backtraces.
* Improve ocamldoc.
* Do not shadow Result.t on older compilers to avoid warning.
* Add the `build` shell script into dev repo for convenience.

## v0.0.2 (parse-argv) 2016-10-20

* support OCaml version 4.02.3 in addition to 4.03.0

## v0.0.1 (parse-argv) 2016-10-13

* initial release of independent parse-argv library (previously in mirage-bootvar-xen, mirage-bootvar-solo5)

## v0.3.2 (mirage-bootvar-xen) 2016-06-09

* Use astring instead of re.str (mirage/mirage-bootvar-xen#18 by @jonludlam)
* Improve the parser to handle quoted strings and escaped characters; skip arguments that don't conform to 'a=b' rather than dying (mirage/mirage-bootvar-xen#18 by @jonludlam)

## 0.3.1 (mirage-bootvar-xen) 2016-02-07

* Fall back to reading `OS.Start_info` if cmdline is not found in Xenstore (mirage/mirage-bootvar-xen#13, by @jonludlam)
* Include the string in error message for malformed variables (mirage/mirage-bootvar-xen#11, by @talex5)
* Enable warnings and remove an unused `Re` import (mirage/mirage-bootvar-xen#11, by @talex5)
* Add travis.yml to Github repo (mirage/mirage-bootvar-xen#12)

## v0.1.1 (mirage-bootvar-solo5) 2015-07-15

* Initial release for Solo5, derived from mirage-bootvar-xen.
* Only implements the Bootvar.argv interface as nothing else is required by
  current Mirage.

## 0.3 (mirage-boovar-xen) 2015-09-15

* Add `Bootvar.parameters` to export the boot paramters (mirage/mirage-bootvar-xen#5, by @Drup)
* Add `Bootvar.argv`, which reformat `Bootvar.parameters` to emulates
  Sys.argv. (mirage/mirage-bootvar-xen#7, by @Drup)

## 0.2 (mirage-bootvar-xen) 2015-03-19

* get no longer raises exception
* add get_exn which raises Parameter_not_found on error
* return 'Ok of t | 'Error of msg in create instead of raising exception on error
* remove debug output

## 0.1 (mirage-bootvar-xen) 2015-03-19

* Initial release
