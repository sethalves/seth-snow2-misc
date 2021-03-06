#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base))

(define flush-output-port flush-output)

(include "snow/bytevector.sld")
(include "seth/port-extras.sld")
(include "seth/port-extras/tests.sld")
(import (seth-tests scheme-read tests))
(display (run-tests))
(newline)
