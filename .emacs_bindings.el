;; swap x and y direction
(define-key global-map "\C-ctf" 'transpose-frame)

;; flip vertically
(define-key global-map "\C-ctv" 'flip-frame)

;; flip horizontally
(define-key global-map "\C-cth" 'flop-frame)

;; rotate 180
(define-key global-map "\C-ctr" 'rotate-frame)

;; rotate 90 deg clockwise
(define-key global-map "\C-ctn" 'rotate-frame-clockwise)

;;rotate 90 deg counter clockwise
(define-key global-map "\C-ctp" 'rotate-frame-anti-clockwise)
