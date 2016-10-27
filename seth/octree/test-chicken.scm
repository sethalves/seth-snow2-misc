#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base))
(include "seth/octree.sld")
(include "seth/octree/tests.sld")
(import (seth octree tests))
(display (run-tests))
(newline)
