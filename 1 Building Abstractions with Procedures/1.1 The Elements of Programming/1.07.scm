;; Exercise 1.7. The `good-enough?` test used in computing square roots will not
;; be very effective for finding the square roots of very small numbers. Also,
;; in real computers, arithmetic operations are almost always performed with
;; limited precision. This makes our test inadequate for very large numbers.
;; Explain these statements, with examples showing how the test fails for small
;; and large numbers. An alternative strategy for implementing `good-enough?` is
;; to watch how `guess` changes from one iteration to the next and to stop when
;; the change is a very small fraction of the guess. Design a square-root
;; procedure that uses this kind of end test. Does this work better for small
;; and large numbers?

;; -----------------------------------------------------------------------------

;; Precision for floating numbers is relative to the magnitude of the number,
;; and for doubles, you get ~16 significant digits. This means that the computer
;; can't distinguish between two numbers x and y, if their relative difference
;; is smaller than ~x/1e16.

;; Demonstration:
(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(good-enough? 1.00000000000000001e10 1e20)
;; #t

(good-enough? 1e-4 1e-10)
;; #t

;; Alternative implementation
(define (good-enough? old new)
  (< (abs (- new old))
     (* old 0.001)))

(define (sqrt-iter old new x)
  (if (good-enough? old new)
      new
      (sqrt-iter new (improve new x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x x))

(sqrt 9.0)
