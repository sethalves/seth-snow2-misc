(define-library (seth graph tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (seth graph))
  (begin
    (define (run-tests)
      (let* ((graph (make-graph))
             (node0 (make-node graph "a" 1))
             (node1 (make-node graph)))
        (connect-nodes graph node0 node1))
      #t)))