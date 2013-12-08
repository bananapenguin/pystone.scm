(require 'unix)
(require 'record)

(define __version__ "0.1")

(define Ident1 1)
(define Ident2 2)
(define Ident3 3)
(define Ident4 4)
(define Ident5 5)

(define Record (make-record-type 'record '(PtrComp Discr EnumComp IntComp StringComp)))
(define create-Record (record-constructor Record))
(define Record-PtrComp (record-accessor Record 'PtrComp))
(define Record-Discr (record-accessor Record 'Discr))
(define Record-EnumComp (record-accessor Record 'EnumComp))
(define Record-IntComp (record-accessor Record 'IntComp))
(define Record-StringComp (record-accessor Record 'StringComp))
(define set-Record-PtrComp! (record-modifier Record 'PtrComp))
(define set-Record-Discr! (record-modifier Record 'Discr))
(define set-Record-EnumComp! (record-modifier Record 'EnumComp))
(define set-Record-IntComp! (record-modifier Record 'IntComp))
(define set-Record-StringComp! (record-modifier Record 'StringComp))
(define copy-Record
  (lambda (RecordPar)
    (create-Record
      (Record-PtrComp RecordPar)
      (Record-Discr RecordPar)
      (Record-EnumComp RecordPar)
      (Record-IntComp RecordPar)
      (Record-StringComp RecordPar)
    )
  )
)

(define IntGlob 0)
(define BoolGlob #f)
(define Char1Glob #\000)
(define Char2Glob #\000)
(define Array1Glob (make-vector 51 0))
(define Array2Glob (make-vector 51 (make-vector 51 0)))
(define PtrGlb '())
(define PtrGlbNext '())

(define Proc1
  (lambda (PtrParIn)
    (let ((NextRecord (copy-Record PtrParIn)))
      (set-Record-PtrComp! PtrParIn NextRecord)
      (set-Record-IntComp! PtrParIn 5)
      (set-Record-IntComp! NextRecord (Record-IntComp PtrParIn))
      (set-Record-PtrComp! NextRecord (Record-PtrComp PtrParIn))
      (set-Record-PtrComp! NextRecord (Proc3 (Record-PtrComp NextRecord)))
      (if (= (Record-Discr NextRecord) Ident1)
        (begin
          (set-Record-IntComp! NextRecord 6)
          (set-Record-EnumComp! NextRecord (Proc6 (Record-EnumComp PtrParIn)))
          (set-Record-PtrComp! NextRecord (Record-PtrComp PtrGlb))
          (set-Record-IntComp! NextRecord (Proc7 (Record-IntComp NextRecord) 10))
        )
        (set! PtrParIn (copy-Record NextRecord))
      )
      (set-Record-PtrComp! NextRecord '())
      PtrParIn
    )
  )
)

(define Proc7
  (lambda (IntParI1 IntParI2)
    (let ((IntLoc (+ IntParI1 2)) (IntParOut))
      (set! IntParOut (+ IntParI2 IntLoc))
      (print IntParI1)
      (print IntParI2)
      (print "")
      IntParOut
    )
  )
)

(define Proc8
  (lambda (Array1Par Array2Par IntParI1 IntParI2)
    (let ((IntLoc (+ IntParI1 5)))
      (vector-set! Array1Par IntLoc IntParI2)
      (vector-set! Array1Par (+ IntLoc 1) (vector-ref Array1Par IntLoc))
      (vector-set! Array1Par (+ IntLoc 30) IntLoc)
      (let loop ((IntIndex IntLoc))
        (if (< IntIndex (+ IntLoc 2))
          (begin
            (vector-set! (vector-ref Array2Par IntLoc) IntIndex IntLoc)
            (loop (+ IntIndex 1))
          )
        )
      )
      (vector-set! (vector-ref Array2Par IntLoc) (- IntLoc 1) (+ (vector-ref (vector-ref Array2Par IntLoc) (- IntLoc 1)) 1))
      (vector-set! (vector-ref Array2Par (+ IntLoc 20)) IntLoc (vector-ref Array1Par IntLoc))
      (set! IntGlob 5)
    )
  )
)

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
    (let ((starttime) (nulltime) (benchtime) (loopsPerBenchtime) (String1Loc))
      (set! starttime (unix-time))
      (let loop ((i loops))
        (if (> i 1)
          (loop (- i 1))
        )
      )
      (set! nulltime (- (unix-time) starttime))

      (set! PtrGlbNext (create-Record '() 0 0 0 0))
      (set! PtrGlb (create-Record '() 0 0 0 0))
      (set-Record-PtrComp! PtrGlb PtrGlbNext)
      (set-Record-Discr! PtrGlb Ident1)
      (set-Record-EnumComp! PtrGlb Ident3)
      (set-Record-IntComp! PtrGlb 40)
      (set-Record-StringComp! PtrGlb "DHRYSTONE PROGRAM, SOME STRING")
      (set! String1Loc "DHRYSTONE PROGRAM, 1'ST STRING")
      (vector-set! (vector-ref Array2Glob 8) 7 10)

      (set! starttime (unix-time))
      (let loop ((i loops))
        (if (> i 1)
          (let ((IntLoc1 2) (IntLoc2 3) (IntLoc3) (CharIndex)
                (String2Loc "DHRYSTONE PROGRAM, 2'ND STRING") (EnumLoc Ident3))
            (Proc5)
            (Proc4)
            (set! BoolGlob (not (Func2 String1Loc String2Loc)))
            (let loop2 ()
              (if (< IntLoc1 IntLoc2)
                (begin
                  (set! IntLoc3 (- (* 5 IntLoc1) IntLoc2))
                  (set! IntLoc3 (Proc7 IntLoc1 IntLoc2))
                  (set! IntLoc1 (+ IntLoc1 1))
                  (loop2)
                )
              )
            )
            (Proc8 Array1Glob Array2Glob IntLoc1 IntLoc3)
            (set! PtrGlb (Proc1 PtrGlb))
            (set! CharIndex #\A)
            (let loop3
              (if (char<=? CharIndex Char2Glob)
                (begin
                  (if (= EnumLoc (Func1 CharIndex #\C))
                    (set! EnumLoc (proc6 Ident1))
                  )
                  (set! CharIndex (integer->char (+ (char->integer CharIndex) 1)))
                  (loop3)
                )
              )
            )
            (set! IntLoc3 (* IntLoc2 IntLoc1))
            (set! IntLoc2 (/ IntLoc3 IntLoc1))
            (set! IntLoc1 (Proc2 IntLoc1))
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
