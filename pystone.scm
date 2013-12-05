(require 'unix)

(define __version__ "0.1")

(define Proc5
  (lambda ()
	'()
  )
)

(define Proc4
  (lambda ()
	'()
  )
)

(define Proc0
  (lambda (loops)
	(let ((starttime) (nulltime) (benchtime) (loopsPerBenchtime))
	  (set! starttime (unix-time))
	  (let loop ((i loops))
		(if (> i 1)
		  (loop (- i 1))
		)
      )
	  (set! nulltime (- (unix-time) starttime))
	  
	  ;PtrGlb
	  
	  (set! starttime (unix-time))
	  (let loop ((i loops))
		(if (> i 1)
		  (let ((IntLoc1 2) (IntLoc2 3) (String2Loc "DHRYSTONE PROGRAM, 2'ND STRING")) 
			(Proc5)
			(Proc4)
		    (loop (- i 1))
		  )
		)
      )

	  (set! benchtime (- (- (unix-time) starttime) nulltime))

	  (if (= benchtime 0)
		(set! loopsPerBenchtime 0)
		(set! loopsPerBenchtime (/ loops benchtime))
	  )

	  (cons benchtime loopsPerBenchtime)
	)
  )
)

(define pystones
  (lambda (loops)
	(Proc0 loops)
  )
)

(define main
  (lambda (loops)
	(let ((result (pystones loops)))
	  (display (string-append
		"Pystone.scm(" __version__ ") time for "
		(number->string loops) " passes = " (number->string (car result)) "\n"
		"This machine benchmarks at " (number->string (cdr result)) " pystones/second\n"
	  ))
	)
  )
)

(main 500)
