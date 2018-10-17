;; GROUP: Environment -> Initialization
(setq inhibit-startup-screen t)

;; Environment -> frame
;; you won't need any of the bar thingies
;; turn it off to save screen estate
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
;; taken from prelude-ui.el
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
                                            (abbreviate-file-name (buffer-file-name))
                                          "%b"))))

;; GROUP: Environment -> Mode Line
;; show point number in mode-line
(setq column-number-mode t)
(setq line-number-mode t)
;; display the dim on the mode-line, and use 24hr.
(display-time-mode 1)
(setq display-time-24hr-format t)

(size-indication-mode t)

;; GROUP: Environment -> Minibuffer
;; (icomplete-mode)

;; GROUP: Environment -> Minibuffer -> Savehist
;; savehist saves minibuffer history by defaults
(setq savehist-additional-variables '(search ring regexp-search-ring) ; also save your regexp search queries
      savehist-autosave-interval 60     ; save every minute
      )

;; GROUP: Environment -> Windows -> Winner ;;
(winner-mode 1)


;;; about faces
;;; ------------------------------

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; ;; change font to Inconsolata for better looking text
;; ;; remember to install the font Inconsolata first
;; (setq default-frame-alist '((font . "Inconsolata-11")))
;; ;; set italic font for italic face, since Emacs does not set italic
;; ;; face automatically
;; (set-face-attribute 'italic nil
;;                    :family "Inconsolata-Italic")

;; set default font
;; sudo apt-get install ttf-bitstream-vera
;; (set-default-font "Bitstream Vera Sans Mono-11")
(set-default-font "DejaVu Sans Mono 12")

;; set default theme
(use-package zenburn-theme)
(load-theme 'zenburn t)

;;; about convenience
;;; Setting for buildin
;;; -----------------

;; GROUP: Convenience -> Revert
;; update any change made on file to the current buffer
(global-auto-revert-mode)

;; ;; GROUP: Convenience -> Hippe Expand
;; ;; hippie-expand is a better version of dabbrev-expand.
;; ;; While dabbrev-expand searches for words you already types, in current
;; ;; buffers and other buffers, hippie-expand includes more sources,
;; ;; such as filenames, klll ring...
;; (global-set-key (kbd "M-/") 'hippie-expand) ;; replace dabbrev-expand
;; (setq
;;  hippie-expand-try-functions-list
;;  '(try-expand-dabbrev ;; Try to expand word "dynamically", searching the current buffer.
;;    try-expand-dabbrev-all-buffers ;; Try to expand word "dynamically", searching all other buffers.
;;    try-expand-dabbrev-from-kill ;; Try to expand word "dynamically", searching the kill ring.
;;    try-complete-file-name-partially ;; Try to complete text as a file name, as many characters as unique.
;;    try-complete-file-name ;; Try to complete text as a file name.
;;    try-expand-all-abbrevs ;; Try to expand word before point according to all abbrev tables.
;;    try-expand-list ;; Try to complete the current line to an entire line in the buffer.
;;    try-expand-line ;; Try to complete the current line to an entire line in the buffer.
;;    try-complete-lisp-symbol-partially ;; Try to complete as an Emacs Lisp symbol, as many characters as unique.
;;    try-complete-lisp-symbol) ;; Try to complete word as an Emacs Lisp symbol.
;; )

;; ;; use abbrev
;; (setq-default abbrev-mode t)
;; (read-abbrev-file "~/.emacs.d/.abbrev_defs")
;; (setq save-abbrevs t)

;; GROUP: Convenience -> HL Line
(global-hl-line-mode)

;; GROUP: Convenience -> Linum
;; enable linum only in programming modes
(add-hook 'prog-mode-hook 'linum-mode)

;; GROUP: Convenience -> Windmove

;; easier window navigation
(windmove-default-keybindings)          ;

;; GROUP: Convenience -> Ibuffer
;; (global-set-key (kbd "C-x C-b") 'ibuffer)
;; (setq ibuffer-use-other-window t) ;; always display ibuffer in another window

;; support C-c and C-v
;; (setq x-select-enable-clipboard t)

;; eliminate long "yes" or "no" prompts
(fset 'yes-or-no-p 'y-or-n-p)


(provide 'setup-environment)
