(define-library (seth raster tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (seth cout)
          (seth raster)
          )
  (begin

    (define (test-spiral)
      ;;   0123456789
      ;; 8 ..........
      ;; 7 ..........
      ;; 6 ..........
      ;; 5 ../--\....
      ;; 4 ..|/\|....
      ;; 3 ...|O|....
      ;; 2 ...\-/....
      ;; 1 ..........
      ;; 0 ..........
      ;; (cout "\n")
      (let* ((pixel-count 0)
             (result (raster-spiral-search
                      (vector 4 3) ;; start
                      (vector 0 0) ;; low
                      (vector 10 9) ;; high
                      (lambda (pos)
                        ;; (cout "pos=" pos "\n")
                        (set! pixel-count (+ pixel-count 1))
                        #f))))
        ;; (cout "pixel-count=" pixel-count "\n")
        (= pixel-count 90)))

    (define (run-tests)
      (let ((img (raster-new 3 3 (list 0 0 0)))
            (list-gt (lambda (a b) (> (apply max a) (apply max b))))
            (list-lt (lambda (a b) (< (apply max a) (apply max b))))
            )
        (raster-set-pixel! img 0 0 (list 5 5 8))
        (raster-set-pixel! img 1 1 (list 3 6 3))
        (and
         (equal? (raster-copy img) img)
         (equal? (raster-get-pixel img 0 0) (list 5 5 8))
         (equal? (raster-new 2 3 (list 1 0 1))
                 (vector (vector '(1 0 1) '(1 0 1))
                         (vector '(1 0 1) '(1 0 1))
                         (vector '(1 0 1) '(1 0 1))))
         (equal? (raster-max img list-gt) (list 5 5 8))
         (equal? (raster-min img list-lt) (list 0 0 0))
         (test-spiral)
         )))))
