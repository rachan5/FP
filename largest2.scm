; for windows .bat file
; @echo off
; Racket.exe "%~f0" %*
; exit /b
#lang racket

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (largest-2-of-3 a b c)
  ;first draft, assumes an ordering to numbers
  ;(cond ((and (>= x y) (>= y z)) (sum-of-sqaures x y))
  ;      ((and (>= y z) (>= z x)) (sum-of-squares y z))
  ;	(else (sum-of-squares x z))
  ;)
  (cond
    ((>= a b) (cond 
                ((>= c a) (sum-of-squares a c)) 
		(else ; c < a 
		  (cond
		    ((>= b c) (sum-of-squares a b))
		    (else (sum-of-squares a c)) ; b < c
		  )
		)
	                 
	      )
    )
    (else ; a < b
       (cond 
         ((>= c b) (sum-of-squares b c))
	 (else ; c < b
	   (cond
	     ((>= a c) (sum-of-squares b a)) 
	     (else ; a < c
	       (sum-of-squares b c)
	     )
	   )
	 )
       )
     )
  )
)

; test cases
(largest-2-of-3 1 2 3)
(largest-2-of-3 2 1 3)
(largest-2-of-3 2 3 1)
(largest-2-of-3 1 3 2)
(largest-2-of-3 3 1 2)
(largest-2-of-3 3 2 1)
