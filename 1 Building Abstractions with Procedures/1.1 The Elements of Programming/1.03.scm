;; Exercise 1.3. Define a procedure that takes three numbers as arguments and
;; returns the sum of the squares of the two larger numbers.

;; -----------------------------------------------------------------------------

(define (sq x) (* x x))

(define (sumsq-of-greater-two x y z)
  (- (+ (sq x)
        (sq y)
        (sq z))
     (sq (min x y z))))
