#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base))
(include "seth/cout.sld")
(include "seth/raster.sld")
(include "seth/raster/tests.sld")
(import (seth raster tests))
(display (run-tests))
(newline)
