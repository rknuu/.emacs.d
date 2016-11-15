
(require 'local nil t)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq inhibit-splash-screen t
      initial-scratch-message nil
      tab-width 2
      visible-bell t)
(setq-default indicate-empty-lines t)
(show-paren-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq column-number-mode t)
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; Configure Markdown
(add-to-list 'auto-mode-alist
	     '("\\.md$" . markdown-mode)
	     '("\\.markdown$" . markdown-mode))
(add-hook 'markdown-mode-hook
	  (lambda ()
	    (visual-line-mode t)
	    (flyspell-mode t)))

;; Handle ANSI color on builds
(require 'ansi-color)
(defun colorize-compialiation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compialation-filter-hook 'colorize-compilation-buffer)

;; Configure Fountain
(add-to-list 'auto-mode-alist '("\\.fountain$" . fountain-mode))
(add-hook 'fountain-mode-hook
	  (lambda ()
	    (setq fountain-add-continued-dialog t)
	    (setq fountain-export-default-command 'fountain-export-buffer-to-html)
	    (setq fountain-export-font '("Courier Prime" "Courier" "Courier New" "monospace"))
	    (setq fountain-export-include-elements-alist
		  '(("screenplay" scene-heading action character paren lines trans center)
		    ("stageplay" section-heading scene-heading action character paren lines trans center)
		    ("director" section-heading scene-heading action character paren lines trans center synopsis note)))
	    (setq fountain-export-scene-heading-format '(bold double-space))
	    (turn-on-olivetti-mode)
	    (imenu-list-minor-mode)))


	     

;(when (>= emacs-major-version 24)
;  (require 'package)
;  (package-initialize)
;  (add-to-list 'package-archives '("gnu";
;				   . "https://elpa.gnu.org/packages/"))
;  (add-to-list 'package-archives '("melpa"
;				   . "https://melpa.org/packages/")))



(if (or (eq system-type "windows-nt") (eq system-type "msdos"))
    (setq ispell-program-name "C:\\Program Files (x86)\\Aspell\\bin\\aspell.exe")
  (setq ispell-program-name "aspell"))

(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))

(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
; '(fountain-add-continued-dialog t)
; '(fountain-export-default-command (quote fountain-export-buffer-to-html))
; '(fountain-export-font
;   (quote
;    ("Courier Prime" "Courier" "Courier New" "monospace")))
; '(fountain-export-include-elements-alist
;   (quote
;    (("screenplay" scene-heading action character paren lines trans center)
;     ("stageplay" section-heading scene-heading action character paren lines trans center)
;     ("director" section-heading scene-heading action character paren lines trans center synopsis note))))
; '(fountain-export-scene-heading-format (quote (bold double-space)))
; '(fountain-mode-hook (quote (turn-on-olivetti-mode imenu-list-minor-mode)))
; '(frame-background-mode nil)
)
