#lang racket
;; =====================================================
;; GUIA DE ESTUDIO RACKET - EJERCICIOS COMPLETOS
;; Autor: Henry Saúl Martínez Flores
;; Objetivo: Practicar funciones, lambdas, map, filter y foldl
;; =====================================================


;; =====================================================
;; EJERCICIO 1 - Suma de elementos de una lista
;; -----------------------------------------------------
;; Usar foldl para acumular los valores de una lista
;; Ejemplo: '(1 2 3 4 5) → 15
;; =====================================================
(define (suma-lista lst)
  (foldl + 0 lst))

(displayln (string-append "Ejercicio 1: " (number->string (suma-lista '(1 2 3 4 5)))))


;; =====================================================
;; EJERCICIO 2 - Filtrar mayores a un número
;; -----------------------------------------------------
;; Aplicar filter y lambda para obtener elementos > n
;; Ejemplo: '(5 3 8 1 10) y n = 4 → '(5 8 10)
;; =====================================================
(define (mayores-que lst n)
  (filter (lambda (x) (> x n)) lst))

(displayln (format "Ejercicio 2: ~a" (mayores-que '(5 3 8 1 10) 4)))


;; =====================================================
;; EJERCICIO 3 - Producto de los elementos
;; -----------------------------------------------------
;; Usar foldl con el operador de multiplicación
;; Ejemplo: '(2 3 4) → 24
;; =====================================================
(define (producto lst)
  (foldl * 1 lst))

(displayln (string-append "Ejercicio 3: " (number->string (producto '(2 3 4)))))


;; =====================================================
;; EJERCICIO 4 - Aplicar una función a todos los elementos
;; -----------------------------------------------------
;; Usar map con una función definida
;; Ejemplo: duplicar '(1 2 3 4) → '(2 4 6 8)
;; =====================================================
(define (duplicar x) (* 2 x))
(displayln (format "Ejercicio 4: ~a" (map duplicar '(1 2 3 4))))


;; =====================================================
;; EJERCICIO 5 - Cuadrado de números
;; -----------------------------------------------------
;; Definir una función pura con lambda
;; Ejemplo: '(1 2 3 4 5) → '(1 4 9 16 25)
;; =====================================================
(define (cuadrados lst)
  (map (lambda (x) (* x x)) lst))

(displayln (format "Ejercicio 5: ~a" (cuadrados '(1 2 3 4 5))))


;; =====================================================
;; EJERCICIO 6 - Duplicar los valores de una lista
;; -----------------------------------------------------
;; Reforzar el uso de map
;; Ejemplo: '(2 4 6) → '(4 8 12)
;; =====================================================
(define (duplicar-lista lst)
  (map (lambda (x) (* 2 x)) lst))

(displayln (format "Ejercicio 6: ~a" (duplicar-lista '(2 4 6))))


;; =====================================================
;; EJERCICIO 7 - Seleccionar los números pares
;; -----------------------------------------------------
;; Practicar filter con una condición lógica
;; Ejemplo: '(1 2 3 4 5 6) → '(2 4 6)
;; =====================================================
(define (pares lst)
  (filter even? lst))

(displayln (format "Ejercicio 7: ~a" (pares '(1 2 3 4 5 6))))


;; =====================================================
;; EJERCICIO 8 - Calcular el promedio de una lista
;; -----------------------------------------------------
;; Combinar foldl con length
;; Ejemplo: '(4 6 8 10) → 7.0
;; =====================================================
(define (promedio lst)
  (/ (foldl + 0 lst) (length lst)))

(displayln (string-append "Ejercicio 8: " (number->string (promedio '(4 6 8 10)))))


;; =====================================================
;; EJERCICIO 9 - Elevar los elementos a una potencia n
;; -----------------------------------------------------
;; Aplicar map con un parámetro adicional
;; Ejemplo: '(2 3 4) y n = 2 → '(4 9 16)
;; =====================================================
(define (elevar lst n)
  (map (lambda (x) (expt x n)) lst))

(displayln (format "Ejercicio 9: ~a" (elevar '(2 3 4) 2)))


;; =====================================================
;; EJERCICIO 10 - Contar cuántos elementos superan un valor
;; -----------------------------------------------------
;; Combinar filter y length
;; Ejemplo: '(5 7 2 9 1 10) y n = 6 → 3
;; =====================================================
(define (contar-mayores lst n)
  (length (filter (lambda (x) (> x n)) lst)))

(displayln (string-append "Ejercicio 10: " (number->string (contar-mayores '(5 7 2 9 1 10) 6))))


;; =====================================================
;; EJERCICIO 11 - Aplicar una función dos veces
;; -----------------------------------------------------
;; Comprender la composición de funciones
;; Ejemplo: sqrt y 16 → 2.0
;; =====================================================
(define (aplicar-dos-veces f x)
  (f (f x)))

(displayln (string-append "Ejercicio 11: " (number->string (aplicar-dos-veces sqrt 16))))


;; =====================================================
;; EJERCICIO 12 - Mini reto integrador
;; -----------------------------------------------------
;; Integrar map, filter y foldl
;; Ejemplo: '(2 5 6 8 3 10) → 480
;; =====================================================
(define (reto lst)
  (foldl * 1 (filter (lambda (x) (> x 5)) lst)))

(displayln (string-append "Ejercicio 12: " (number->string (reto '(2 5 6 8 3 10)))))
