(define-library (seth-tests scheme-read tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (scheme file)
          (seth scheme-read)
          (seth port-extras)
          )
  (begin
    (define (run-tests)
      (let* ((inp (open-binary-input-file
                   (if (file-exists? "tests.sld")
                       "tests.sld"
                       "seth-tests/scheme-read/tests.sld")))
             (tokens (scheme-read inp)))
        ;; (tokens->trees get-next-token #f verbose)
        (write tokens)
        (newline)
        #t))))
