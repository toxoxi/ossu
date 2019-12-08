
;; student-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to help a teacher organize their next field trip. 
; On the trip, lunch must be provided for all students. For each student, track 
; their name, their grade (from 1 to 12), and whether or not they have allergies.
; 


(define-struct student (name grade allergic?))
;; Student is (make-student String Natural(1..12) Boolean)
;; interp. a student with name, grade between 1 and 12, and allergic whether or not they have allergies.

(define S1 (make-student "Jenny" 1 false))
(define S2 (make-student "Taro" 6 true))
(define S3 (make-student "toxoxi" 12 true))

#;
(define (fn-for-student s)
  (... (student-name m)        ;String
       (student-grade m)       ;Natural(1..10)
       (student-allergic? m))) ;Boolean

;; Template rules used:
;; - compound: 3 fields

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; To plan for the field trip, if students are in grade 6 or below, the teacher 
; is responsible for keeping track of their allergies. If a student has allergies, 
; and is in a qualifying grade, their name should be added to a special list. 
; Design a function to produce true if a student name should be added to this list.
; 


;; Student -> Boolean
;; produce true if student's grade is less than 6 and allergic
(check-expect (qualify-allergy-list-spec? S1) false)
(check-expect (qualify-allergy-list-spec? S2) true)
(check-expect (qualify-allergy-list-spec? S3) false)

;(define (qualify-allergy-list-spec? s) false) ;stub

(define (qualify-allergy-list-spec? s)
  (and (<= (student-grade s) 6)
       (student-allergic? s)))
