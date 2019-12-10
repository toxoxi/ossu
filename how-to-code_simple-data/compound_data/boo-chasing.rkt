; Boo chase your pointer, Run away!

; Boo program.
; 
; Chase your pointer each second by 1px.
; 
; Domain Analysis is below.
; 
; Constants:
; - WIDTH
; - HEIGHT
; - MTS
; - CHASE_SPEED
; - BOO-IMAGE
; 
; Changing:
; - boo's x position
; - boo's y position


(require 2htdp/image)
(require 2htdp/universe)

;; =================
;; Constants:

(define WIDTH 1200)
(define HEIGHT 800)
(define MTS (empty-scene WIDTH HEIGHT))

(define CHASE_SPEED 3)
(define BOO-IMAGE .)


;; =================
;; Data definitions:

(define-struct boo (x y))
;; Boo is (make-boo Natural Natural)
;; interp. (make-boo x y) is a boo with x, y coordinate
;;         x and y is in screen coordinates

(define B1 (make-boo 10 90))  ; at 10, 90 in screen.
(define B2 (make-boo 50 200)) ; at 50, 200 in screen.

(define (fn-for-boo b)
  (... (boo-x b)   ;Natural
       (boo-y b))) ;Natural

;; Template rules used:
;;  - compound: 2 fields


;; =================
;; Functions

;; Boo -> Boo
;; called to make the boo chasing you; start with (main (make-boo 0 0))
;; no tests for main function
(define (main b)
  (big-bang b
    (on-mouse next-boo)      ; Boo -> Boo
    (to-draw render-boo)))   ; Boo -> Image

;; Boo -> Boo
;; produce next boo with player's current coordinate of the mouse.
(check-expect (next-boo (make-boo 0 0) 50 50 "move") (make-boo (+ 0 CHASE_SPEED) (+ 0 CHASE_SPEED)))
(check-expect (next-boo (make-boo 20 100) 50 50 "move") (make-boo (+ 20 CHASE_SPEED) (- 100 CHASE_SPEED)))
(check-expect (next-boo (make-boo 100 40) 50 50 "move") (make-boo (- 100 CHASE_SPEED) (+ 40 CHASE_SPEED)))
(check-expect (next-boo (make-boo 100 100) 50 50 "move") (make-boo (- 100 CHASE_SPEED) (- 100 CHASE_SPEED)))
(check-expect (next-boo (make-boo 100 100) 100 50 "move") (make-boo 100 (- 100 CHASE_SPEED)))

;; Boo Natural Natural MouseEvent -> Boo
;; produce next boo with coorinates
(define (next-boo b x y me)
  (make-boo
   (calc-coordinate (boo-x b) x)
   (calc-coordinate (boo-y b) y)))

;; Natural Natural -> Natural
;; bc: boo's coordinate, pointer: pointer's coordinate
(define (calc-coordinate bc pointer)
  (cond [(= bc pointer) pointer]
        [(> bc pointer) (- bc CHASE_SPEED)]
        [else (+ bc CHASE_SPEED)]))

;; Boo -> Image
;; render boo with boo's x, y coordinate
(check-expect (render-boo (make-boo 0 0)) (place-image BOO-IMAGE 0 0 MTS))
(check-expect (render-boo (make-boo 20 100)) (place-image BOO-IMAGE 20 100 MTS))
(check-expect (render-boo (make-boo 100 40)) (place-image BOO-IMAGE 100 40 MTS))
(check-expect (render-boo (make-boo 100 100)) (place-image BOO-IMAGE 100 100 MTS))

;(define (render-boo b) MTS) ;stub
(define (render-boo b) (place-image BOO-IMAGE (boo-x b) (boo-y b) MTS))