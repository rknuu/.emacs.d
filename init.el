
(require 'local nil t)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq column-number-mode t
      inhibit-splash-screen t
      initial-scratch-message nil
      tab-width 2
      visible-bell t)
(setq-default indicate-empty-lines t)
(show-paren-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(use-package conf-mode
  :mode (("\\.gitconfig\\'" . conf-mode)))
(use-package yaml-mode
  :mode (("\\.yml\\'" . yaml-mode)
	 ("\\.yaml\\'" . yaml-mode)))
(use-package markdown-mode
  :mode (("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :config
  (visual-line-mode t)
  (flyspell-mode t))

(use-package compilation-mode
  :init
  (add-hook 'compialation-filter-hook
	    (lambda()
	      (require 'ansi-color)
	      (toggle-read-only)
	      (ansi-color-apply-on-region (point-min) (point-max))
	      (toggle-read-only))))

;; Configure Fountain
(use-package fountain-mode
  :mode "\\.fountain$"
  :init
  (add-hook 'fountain-mode-hook
	    (lambda()
	      (turn-on-olivetti-mode)
	      (imenu-list-minor-mode)))
  :config
  (setq fountain-add-continued-dialog t)
  (setq fountain-export-default-command 'fountain-export-buffer-to-html)
  (setq fountain-export-font '("Courier Prime" "Courier" "Courier New" "monospace"))
  (setq fountain-export-include-elements-alist
	'(("screenplay" scene-heading action character paren lines trans center)
	  ("stageplay" section-heading scene-heading action character paren lines trans center)
	  ("director" section-heading scene-heading action character paren lines trans center synopsis note)))
  (setq fountain-export-scene-heading-format '(bold double-space)))

(use-package ispell
  :if (and 
       (eq system-type "windows-nt")
       (eq system-type "msdos"))
  :config
  (setq ispell-program-name "C:\\Program Files (x86)\\Aspell\\bin\\aspell.exe")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")))

(use-package edit-server
  :if window-system
  :init
  (add-hook 'after-init-hook 'server-start t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default))))
