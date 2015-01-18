#!/usr/local/bin/foment

(import (scheme base)
        (scheme write)
        (seth-tests flex tests))
(display (run-tests))
(newline)
