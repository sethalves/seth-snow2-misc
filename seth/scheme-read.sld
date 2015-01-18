(define-library (seth scheme-read)
  (export scheme-read)
  (import (scheme base)
          (seth flex)
          (seth port-extras)
          )

  (include "scheme-read/scm-reader-table.scm")

  (begin
    (define (scheme-read inp)
      (let* ((data (read-all-u8 inp))
             (tokens (tokinize scm-reader-table data))
             ;; (get-next-token (lambda ()
             ;;                   (cond ((null? tokens) #f)
             ;;                         (else
             ;;                          (let ((ret (car tokens)))
             ;;                            (set! tokens (cdr tokens))
             ;;                            ret)))))
             )
        tokens))))
        
