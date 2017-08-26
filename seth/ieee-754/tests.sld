(define-library (seth ieee-754 tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (seth math-3d)
          (seth ieee-754))
  (begin

    (define (ieee-754-test-0)
      ;; (cout (ieee-754->number #x7f7fffff) "\n")
      ;; (cout (ieee-754->number #xff800001) "\n")
      (and
       (almost= (ieee-754->number #x3eaaaaab) 0.333333 0.001)
       (= (ieee-754->number #x3f800000) 1)
       (= (ieee-754->number #xc0000000) -2)
       (almost= (ieee-754->number #x00000000) 0 0.000001)
       (almost= (ieee-754->number #x80000000) -0 0.000001)
       ;; (eqv? (ieee-754->number #x7f800000) +inf.0)
       ;; (eqv? (ieee-754->number #xff800000) -inf.0)

       ;; (eqv? (ieee-754->number #xff800001) +nan.0)

       ;; bigloo can't do this one?
       ;; (almost= (ieee-754->number #x7f7fffff) 3.4028234e38 1e31)

       (= (number->ieee-754 12.375) #x41460000)
       (= (number->ieee-754 1.0) #x3f800000)
       (= (number->ieee-754 0.375) #x3ec00000)

       #t))


    (define (ieee-754-test-1)
      (let* ((bits (number->ieee-754 0.1))
             (n (ieee-754->number bits)))
        ;; (cout (number->string bits 16) "\n")
        ;; (cout (ieee-754->number bits) "\n")
        (almost= n 0.1 0.0000001)))

    (define (run-tests)
      (and
       (ieee-754-test-0)
       (ieee-754-test-1)))

    ))
