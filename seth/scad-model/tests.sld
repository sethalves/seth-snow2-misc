(define-library (seth scad-model tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (seth scad-model))
  (begin
    (define (run-tests)
      #t)))
