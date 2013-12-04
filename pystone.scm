(define Proc0
  (lambda (loops)
	'()
  )
)

(define pystones
  (lambda (loops)
	(Proc0 loops)
  )
)

(define main
  (lambda (loops)
	(pystones loops)
	(display (string-append "Pystone.scm " "result\n"))
	(display "This machine benchmarks at * pystones/second\n")
  )
)

(main 500)
