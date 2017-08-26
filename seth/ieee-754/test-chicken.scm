#! /bin/sh
#| -*- scheme -*-
exec csi -s $0 "$@"
|#

(use r7rs)
(import-for-syntax r7rs)
(import (scheme base))
(include "seth/ieee-754.sld")
(include "seth/ieee-754/tests.sld")
(import (seth ieee-754 tests))
(display (run-tests))
(newline)
