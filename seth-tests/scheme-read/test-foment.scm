#!/usr/local/bin/foment

(import (scheme base)
        (scheme write)
        (seth-tests scheme-read tests))
(display (run-tests))
(newline)
