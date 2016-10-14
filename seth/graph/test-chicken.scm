#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base))
(include "seth/graph.sld")
(include "seth/graph/tests.sld")
(import (seth graph tests))
(display (run-tests))
(newline)
