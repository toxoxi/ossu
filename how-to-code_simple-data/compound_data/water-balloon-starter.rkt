
;; water-balloon-starter.rkt

; PROBLEM:
; 
; In this problem, we will design an animation of throwing a water balloon.  
; When the program starts the water balloon should appear on the left side 
; of the screen, half-way up.  Since the balloon was thrown, it should 
; fly across the screen, rotating in a clockwise fashion. Pressing the 
; space key should cause the program to start over with the water balloon
; back at the left side of the screen. 
; 
; NOTE: Please include your domain analysis at the top in a comment box. 
; 
; Use the following images to assist you with your domain analysis:
; 
; 
; 1)
; 2).
; .
; 3)
; .
; 4)
; 
; .
;     
; 
; Here is an image of the water balloon:
; (define WATER-BALLOON.)
; 
; 
; 
; NOTE: The rotate function wants an angle in degrees as its first 
; argument. By that it means Number[0, 360). As time goes by your balloon 
; may end up spinning more than once, for example, you may get to a point 
; where it has spun 362 degrees, which rotate won't accept. 
; 
; The solution to that is to use the modulo function as follows:
; 
; (rotate (modulo ... 360) (text "hello" 30 "black"))
; 
; where ... should be replaced by the number of degrees to rotate.
; 
; NOTE: It is possible to design this program with simple atomic data, 
; but we would like you to use compound data.
; 
; 
; Domain Analysis
; 
; Constants:
;  - HEIGHT
;  - CTR-Y
;  - MTS
; 
; Changing:
;  - balloon's degree -> Number[0, 360)
;  - balloon's x position


(require 2htdp/image)
(require 2htdp/universe)

;; =================
;; Constants:

(define WIDTH  500)
(define HEIGHT 300)


(define CTR-Y (/ HEIGHT 2)) 


(define WATER-BALLOON.)
(define ROTATE-RATE 5)
(define SPEED-RATE 5)

(define MTS (empty-scene WIDTH HEIGHT))


;; =================
;; Data definitions:

(define-struct bln (x deg))
;; Balloon is (make-bln Integer Number[0, 360))
;; interp. (make-bln x deg) is a balloon with x coordinate and degree
;;         the x is the center of the balloon
;;         x is in screen coordinates
;;         deg is degree of rotate to balloon

(define B1 (make-bln 10 90))  ; at 10, rotate 90 deg.
(define B2 (make-bln 30 180)) ; at 30, rotate 180 deg.

#;
(define (fn-for-bln b)
  (... (bln-x b)     ;Integer
       (bln-deg b))) ;Number[0, 360)

;; Template rules used:
;;  - compound: 2 fields


;; =================
;; Functions

;; Balloon -> Balloon
;; called to make the balloonn thrown left to right with rotating; start with (main (make-bln 0 1))
;; no tests for main function
(define (main b)
  (big-bang b
    (on-tick next-bln)       ; Balloon -> Balloon
    (to-draw render-bln)))   ; Balloon -> Image

;; Balloon -> Balloon
;; make next balloon, rotate and move to right
(check-expect (next-bln (make-bln 10 30)) (make-bln (+ SPEED-RATE 10)  (modulo (+ ROTATE-RATE 30)  360)))
(check-expect (next-bln (make-bln 20 350)) (make-bln (+ SPEED-RATE 20) (modulo (+ ROTATE-RATE 350) 360)))
(check-expect (next-bln (make-bln 30 355)) (make-bln (+ SPEED-RATE 30) (modulo (+ ROTATE-RATE 355) 360)))

;(define (next-bln b) b) ;stub
(define (next-bln b)
  (make-bln (+ (bln-x b) SPEED-RATE) (calc-degree (bln-deg b))))

;; Number[0, 360) -> Number[0, 360)
;; calculate degree by adding ROTATE-RATE, result is below 360.
(define (calc-degree deg)
  (modulo (+ deg ROTATE-RATE) 360))

;; Balloon -> Balloon
;; render balloon with current x position and degree
(check-expect (render-bln (make-bln 10 30))  (place-image (rotated-balloon (make-bln 10 30))  (+ 10 SPEED-RATE) CTR-Y MTS))
(check-expect (render-bln (make-bln 20 350)) (place-image (rotated-balloon (make-bln 20 350)) (+ 20 SPEED-RATE) CTR-Y MTS))
(check-expect (render-bln (make-bln 30 355)) (place-image (rotated-balloon (make-bln 30 355)) (+ 30 SPEED-RATE) CTR-Y MTS))

;(define (render-bln b) WATER-BALLOON) ;stub

(define (render-bln b)
   (place-image (rotated-balloon b) (+ (bln-x b) SPEED-RATE) CTR-Y MTS))

;; Balloon -> Image
;; produce balloon image with given balloon's degree
(define (rotated-balloon b)
  (rotate (bln-deg b) WATER-BALLOON))