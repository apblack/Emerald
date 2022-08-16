In Scheme: 

(define (y* f)
  ((lambda (x) (f (lambda () (x x))))
   (lambda (x) (f (lambda () (x x))))))

(define fact-core                   
  (lambda (f)
    (lambda (n)
      (if (= n 0)
	  1
	  (* n ((f) (- n 1)))))))

(define append-core
  (lambda (f)
    (lambda (l1 l2)
      (if (null? l1)
	  l2
	  (cons (car l1)
		((f) (cdr l1) l2))))))

((y* fact-core) 0)
((y* fact-core) 3)

((y* append-core) '(1 2 3) '(4 5 6))


In Emerald:

const Y = object Y
            export op * [ function [ function [
