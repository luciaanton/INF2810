;; Forelesning 1

;; Programmeringspråk: Scheme

;; Datatyper som tall, strenger og boolske konstanter er 
;; eksempler på primitive / atomære uttrykk.

"Dette er en streng"
;; "Dette er en streng"

42
;; 42

3.14159
;; 3.14159

1/3
;; 1/3

#t ;; true
;; #t

#f ;; false
;; #f

;; ----------------------------------------
;; Prosedyrer og navngitte variabler
;; ----------------------------------------
;; Parentesbasert prefiksnotasjon
;; Scheme-kode består av lister.
;; Første element (prefikset) er operatoren (prosedyre).
;; Resten av lista består av operandene (argumentene / parameterene).
(+ 1 2)
;; 3
(+ 1 2 10 7 5)
;; 25

;; define: er en såkalt special form, ikke en vanlig prosedyre. 
;; Brukes for å introdusere en leksikalsk variabel: 
;; symbol som bindes til en verdi.
(define foo 42)
foo
;; 42
(+ foo 58)
;; 100
;;(+ foo bar)
;; !!! bar: undefined; cannot reference undefined identifier
(* 10 (+ foo 58))
;; 1000
(/ (+ 10 20) 2)
;; 15
(* (+ foo 58)
   (- (/ 8 2)
      2))
;; 200

;; ----------------------------------------
;; Schemes evalueringsregel
;; ----------------------------------------
;; 1) Evaluér enkelt-uttrykkene i sammensetningen
;;    a) Atomære uttrykk: evalueres til seg selv.
;;    b) Leksikalske variabler og prosedyrenavn: evalueres til verdiene 
;;    de refererer til.
;;    c) Sammensatte utrykk: anvend 1) igjen.
;; 2) Anvend operatoren (det første uttrykket i lista) på verdiene 
;; til de andre uttrykkene.

;; Unntaket er special forms (som define), 
;; som hver har sine egne evalueringsregler.

;; ----------------------------------------
;; Å opprette egne prosedyrer med define
;; ----------------------------------------
;; (define ⟨navn⟩
;;    (lambda (⟨argumenter⟩)
;;      ⟨kropp⟩))
(define snitt
  (lambda (x y)
    (/ (+ x y) 2)))

(snitt 10 20)
;; 15

;; Det finnes også en kortform som sløyfer lambda:
;; (define (⟨navn⟩ ⟨argumenter⟩) 
;;     ⟨kropp⟩)
(define (snitt-1 x y)
  (/ (+ x y) 2))

;; ----------------------------------------
;; Predikater og kondisjonale uttrykk
;; ----------------------------------------
;; Predikater er prosedyrer eller uttrykk som returnerer sant / usant (#t / #f).
(> 3 4)
;; #f
(even? 2)
;; t
(define a 6)
(zero? a)
;; #f

;; De logiske konnektivene and og or er (også) special forms.
;; Sammen med kondisjonale uttrykk som f.eks if og cond 
;; kan vi bruke predikater og konnektiver til å kontrollere flyten i et program.

;; (if ⟨test⟩ 
;     ⟨utfall-hvis-sant⟩
;;    ⟨utfall-hvis-usant⟩)

(if (number? 42)
    "number"
    "something else")
;; "number"

;; (cond (⟨test1⟩ ⟨utfall1⟩) 
;;       (⟨test2⟩ ⟨utfall2⟩)
;;       (⟨testn⟩ ⟨utfalln⟩) 
;;       (else ⟨utfall⟩))

(cond ((> 42 3) "greater")
      ((< 42 3) "less")
      (else "equal"))
;; "greater"
