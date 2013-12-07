(require 'unix)

(define __version__ "0.1")

(define Ident1 1)
(define Ident2 2)
(define Ident3 3)
(define Ident4 4)
(define Ident5 5)

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

(define Func1
  (lambda (CharPar1 CharPar2)
    (let ((CharLoc1 CharPar1) (CharLoc2 CharPar2))
      (if (not (char=? CharLoc1 CharLoc2))
        Ident1
        Ident2
      )
    )
  )
)

(define Func2
  (lambda (StrParI1 StrParI2)
    (let ((IntLoc 1) (CharLoc))
      (let loop ()
        (if (<= IntLoc 1)
          (begin
            (if (= (Func1 (string-ref StrParI1 IntLoc) (string-ref StrParI2 (+ IntLoc 1))) Ident1)
              (begin
                (set! CharLoc #\A)
                (set! IntLoc (+ IntLoc 1))
              )
            )
            (loop)
          )
        )
      )
      (if (and (char>=? CharLoc #\W) (char<=? CharLoc #\Z))
        (!set IntLoc 7)
      )
      (if (char=? CharLoc #\X)
        #t
        (begin
          (if (string>? StrParI1 StrParI2)
            (begin
              (set! IntLoc (+ IntLoc 7))
              #t
            )
            #f
          )
        )
      )
    )
  )
)

(define Func3
  (lambda (EnumParIn)
    (let ((EnumLoc EnumParIn))
      (if (= EnumLoc Ident3)
        #t
        #f
      )
    )
  )
)

(main 500)
(print (Func2 "ZZASDFG" "QW@#E"))

