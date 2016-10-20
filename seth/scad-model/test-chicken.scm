#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base))
(include "seth/scad-model.sld")
(include "seth/scad-model/tests.sld")
(import (seth scad-model tests))
(display (run-tests))
(newline)
