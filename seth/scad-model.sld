(define-library (seth scad-model)
  (export make-scad-polyhedron
          scad-polyhedron?
          scad-polyhedron-points
          scad-polyhedron-set-points!
          scad-polyhedron-faces
          scad-polyhedron-set-faces!
          scad-polyhedron-convexity
          scad-polyhedron-set-convexity!
          write-scad-file
          model->scad-polyhedron)
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

    (define-record-type <scad-polyhedron>
      (make-scad-polyhedron points faces convexity)
      scad-polyhedron?
      (points scad-polyhedron-points scad-polyhedron-set-points!)
      (faces scad-polyhedron-faces scad-polyhedron-set-faces!)
      (convexity scad-polyhedron-convexity scad-polyhedron-set-convexity!))


    (define (write-scad-polyhedron polyhedron port)
      (snow-assert (scad-polyhedron? polyhedron))
      (snow-assert (output-port? port))
      ;; polyhedron( points = [ [X0, Y0, Z0], [X1, Y1, Z1], ... ], faces = [ [P0, P1, P2, P3, ...], ... ], convexity = N);
      (cout "polyhedron(\n    points = [" port)
      (let ((need-spaces #f)
            (need-comma #f))
        (for-each
         (lambda (vertex)
           (if need-comma (cout ",\n"))
           (set! need-comma #t)
           (if need-spaces (cout "              " port));
           (set! need-spaces #t)
           (cout (format "[~a, ~a, ~a]"
                         (vector3-x vertex)
                         (vector3-y vertex)
                         (vector3-z vertex)) port))
         (scad-polyhedron-points polyhedron))
        (cout "],\n    faces = [" port))

      (let ((need-spaces #f))
        (for-each
         (lambda (face)
           (let ((need-comma #f))
             (if need-spaces (cout ",\n             " port))
             (set! need-spaces #t)
             (cout "[" port)
             (vector-map
              (lambda (face-corner-index)
                (if need-comma (cout ", " port))
                (set! need-comma #t)
                (cout face-corner-index port))
              face))
           (cout "]" port))
         (scad-polyhedron-faces polyhedron)))

      (cout "],\n    convexity = " (scad-polyhedron-convexity polyhedron) ");\n" port))


    (define (write-scad-file top-levels port)
      (snow-assert (list? top-levels))
      (snow-assert (output-port? port))
      (for-each
       (lambda (top-level)
         (cond ((scad-polyhedron? top-level) (write-scad-polyhedron top-level port))
               (else
                (cerr "unknown openscad top-level: " top-level "\n"))))
       top-levels))


    (define (model->scad-polyhedron model)
      (snow-assert (model? model))
      (let ((points (vector->list (coordinates-as-vector (model-vertices model))))
            (faces '())
            (convexity 10))
        (operate-on-faces
         model
         (lambda (mesh face)
           (set! faces (cons
                        (vector-map
                         (lambda (face-corner)
                           (snow-assert (face-corner? face-corner))
                           (face-corner-vertex-index face-corner))
                         (list->vector (reverse (vector->list (face-corners face)))))
                        faces))
           face))
        (make-scad-polyhedron points faces convexity)))


    ))
