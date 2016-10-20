(define-library (seth scad-model)
  (export write-scad-model)
  (import (scheme base)
          (scheme file)
          (scheme write)
          (scheme cxr)
          (scheme process-context)
          (srfi 13)
          (srfi 29)
          (srfi 69)
          (snow assert)
          (snow input-parse)
          (seth cout)
          (seth strings)
          (seth math-3d)
          (seth model-3d))
  (cond-expand
   (chicken (import (extras)))
   (else))

  (begin

    (define (write-scad-model model port)
      (snow-assert (model? model))
      (snow-assert (output-port? port))

      ;; polyhedron( points = [ [X0, Y0, Z0], [X1, Y1, Z1], ... ], faces = [ [P0, P1, P2, P3, ...], ... ], convexity = N);

      (cout "polyhedron(\n    points = [" port)

      (let ((need-spaces #f)
            (need-comma #f))
        (vector-for-each
         (lambda (vertex)
           (if need-comma (cout ",\n"))
           (set! need-comma #t)
           (if need-spaces (cout "              " port));
           (set! need-spaces #t)
           (cout (format "[~a, ~a, ~a]"
                         (vector3-x vertex)
                         (vector3-y vertex)
                         (vector3-z vertex)) port))
         (coordinates-as-vector (model-vertices model)))
        (cout "],\n    faces = [" port))

      (let ((need-spaces #f))
        (operate-on-faces
         model
         (lambda (mesh face)
           (let ((need-comma #f))
             (if need-spaces (cout ",\n             " port))
             (set! need-spaces #t)
             (cout "[" port)
             (vector-map
              (lambda (face-corner)
                (snow-assert (face-corner? face-corner))
                (if need-comma (cout ", " port))
                (set! need-comma #t)
                (cout (face-corner-vertex-index face-corner) port))
              (face-corners face)))
           (cout "]" port)
           face)))

      (cout "],\n    convexity = 10);\n" port))
    ))
