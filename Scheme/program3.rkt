;Jack Cobb
;jack3
;#905659469

;Return max
(define (greatest val1 val2)
  (cond ((> val1 val2)
             (+ 0 val1))
        (else (+ 0 val2))))
;Recursive function for state count
(define (recurseState input)
  (cond
   ((list? input) 
    (cond ((null? input)
           (+ 0 0)
    )(else 
      (cond 
           ((equal? (caar input) 'id)
               (+ 1 (recurseState (cdr input))))
           ((equal? (caar input) 'while)               
               (+ 1 (+ (recurseState (cddar input)) (recurseState (cdr input)))))
           ((equal? (caar input) 'if)
               (+ 1 (+ (recurseState (cdddar input)) (recurseState (cdr input)))))     
        )))       
 )))

;Recursive function for depth count
(define (recurseDepth input curdepth)
  (cond
   ((list? input) 
    (cond ((null? input)
           (+ 0 curdepth)
    )(else 
      (cond 
           ((equal? (caar input) 'id)
               (greatest curdepth (recurseDepth (cdr input) curdepth)))
           ((equal? (caar input) 'while)            
               (greatest (recurseDepth (cddar input) (+ 1 curdepth)) (recurseDepth (cdr input) curdepth)))
           ((equal? (caar input) 'if)   
               (greatest (recurseDepth (cdddar input) (+ 1 curdepth)) (recurseDepth (cdr input) curdepth)))     
        )))       
)))

;Parse function
(define (parse input)
  (cons "NumberOfStatements:" (cons (recurseState input) (cons "MaximumDepth:" (cons (recurseDepth input 0) '()))))
  )

;Call the test functions
(parse '((id = id - const)))
(parse '((id = id + id) (id = id - id)))
(parse '((if bool then (id = const / const))))
(parse '((if bool then (id = const / const)(id = id + id))))
(parse '((if bool then (id = const / const))(while bool (id = a - const))))
(parse '((id = id + id)(if bool then (id = const / const)(id = id + id))(while bool 
                           (id = a - const)(id = id -id))))
(parse '((id = id + id)(if bool then (if bool then ( id = id + id ))
                           (id = const / const)(id = id + id))(while bool (id = a - const)(id = id -id))))
(parse '((id = id + id)(if bool then (if bool then ( id = id + id ))
                           (id = const / const)(id = id + id))(while bool (id = a - const)(if bool then 
                            (if bool then ( id = id + id ))(id = const / const)(id = id + id))(id = id - id))))