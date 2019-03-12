;; *Exercise 1.8:* Newton's method for cube roots is based on the fact that if y
;; is an approximation to the cube root of x, then a better approximation is
;; given by the value
;;
;; x/y^2 + 2y
;; ----------
;;     3
;;
;; Use this formula to implement a cube-root procedure analogous to the
;; square-root procedure.

;; -----------------------------------------------------------------------------

(define (cube-root x)
  (cube-root-iter 1.0 x x))

(define (cube-root-iter old new x)
  (if (good-enough? old new)
      new
      (cube-root-iter new (improve new x) x)))

(define (good-enough? old new)
  (< (abs (- new old))
     (* old 0.001)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))

;; Test
(cube-root 27.0)
