(define-library (seth image tests)
  (export run-tests)
  (import (scheme base)
          (scheme write)
          (seth cout)
          (seth raster)
          (seth image))
  (begin

(define (image-test-line)
  (let ((img (raster-new 70 20 (vector 0 0 0 255))))
    (image-line! img (vector 255 255 255 255)
                 -10 -10
                 30 30
                 rgba)
    (if #f
        (do ((y 0 (+ y 1)))
            ((> y 19))
          (do ((x 0 (+ x 1)))
              ((> x 69))
            (if (equal? (raster-get-pixel img x y) (vector 255 255 255 255))
                (cout "X")
                (cout " ")))
          (cout "\n"))
        #t)
    #t))

    (define (run-tests)


      #t)))
