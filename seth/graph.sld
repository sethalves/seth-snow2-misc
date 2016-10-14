
(define-library (seth graph)
  (export make-graph
          graph?
          graph-nodes
          graph-set-nodes!
          make-node
          node?
          node-edges
          node-set-edges!
          node-value
          node-set-value!
          node-data
          node-set-data!
          edge?
          edge-start-node
          edge-set-start-node!
          edge-end-node
          edge-set-end-node!
          edge-value
          edge-set-value!
          edge-data
          edge-set-data!
          connect-nodes)
  (import (scheme base))
  (begin

    (define-record-type <node>
      (make-node~ edges value data)
      node?
      (edges node-edges node-set-edges!)
      (value node-value node-set-value!)
      (data node-data node-set-data!))


    (define-record-type <edge>
      (make-edge~ start-node end-node value data)
      edge?
      (start-node edge-start-node edge-set-start-node!)
      (end-node edge-end-node edge-set-end-node!)
      (value edge-value edge-set-value!)
      (data edge-data edge-set-data!))


    (define-record-type <graph>
      (make-graph~ nodes edges)
      graph?
      (nodes graph-nodes graph-set-nodes!)
      (edges graph-edges graph-set-edges!))


    (define (make-graph)
      (make-graph~ (list)))


    (define (make-node graph value data)
      (let ((node (make-node~ (list) value data)))
        (graph-set-nodes! graph (cons node (graph-nodes graph)))))


    (define (connect-nodes graph start-node end-node . maybe-value+data)
      (let* ((value (if (null? maybe-value+data) #f (car maybe-value+data)))
             (data (if (or (null? maybe-value+data)
                           (null? (cdr maybe-value+data)))
                       #f
                       (cadr maybe-value+data)))
             (edge (make-edge~ start-node end-node value data)))
        (graph-set-edges! graph (cons edge (graph-edges graph)))
        (node-set-edges! start-node (cons edge (node-edges start-node)))
        (node-set-edges! end-node (cons edge (node-edges end-node)))))


    ))
