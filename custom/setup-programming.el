;;; Programming -> common
;;; ------------------------

;;;; source code editing
;;;; --------------------

;; hs-minor-mode allow users to fold and hide blocks of text
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; narrow
;; C-x n d/r/n/w

;;; bellowing for  Indentation part


;; GROUP: Programming -> Tools -> Ediff
(setq ediff-diff-options "-w"
      ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
;; you can clean whitespace use command:
;; (whitespace-cleanup)

;;; compile and debug
;;; -------------------
;; GROUP: Programming -> Tools -> Compilation

;; ;; GROUP: Programming -> Tools -> Makefile
;; ;; takenn from prelude-c.el:48: https://github.com/bbatsov/prelude/blob/master/modules/prelude-c.el
;; (defun prelude-makefile-mode-defaults ()
;;   (whitespace-toggle-options '(tabs))
;;   (setq indent-tabs-mode t ))

;; (setq prelude-makefile-mode-hook 'prelude-makefile-mode-defaults)

;; (add-hook 'makefile-mode-hook (lambda ()
;;                                                                (run-hooks 'prelude-makefile-mode-hook)))

;; ;; Compilation from Emacs
;; ;; setup compilation-mode used by `compile' command
;; (require 'compile)
;; (setq compilation-ask-about-save nil          ; Just save before compiling
;;       compilation-always-kill t               ; Just kill old compile processes before starting the new one
;;       compilation-scroll-output 'first-error) ; Automatically scroll to first
;; (global-set-key (kbd "<f5>") 'compile)




;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))


;; GROUP: Programming -> Tools -> Gdb
(setq gdb-many-windows t        ; use gdb-many-windows by default
            gdb-show-main t)    ; Non-nil means display source file containing the main routine at startup


;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))     ; automatically indent when press RET


(provide 'setup-programming)
