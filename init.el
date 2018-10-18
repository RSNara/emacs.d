;; install MELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))


;; list all installed packages here
(defvar my-packages '(exec-path-from-shell
                      monokai-theme
                      matlab-mode
                      clojure-mode
                      cider
                      centered-cursor-mode
		      auctex
		      adaptive-wrap
		      pabbrev))

;; install packages
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; initialization
(exec-path-from-shell-initialize)
(load-theme 'monokai t)

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/.notes/index.org")
(setq org-agenda-files (list "~/.agenda/school.org"))

(with-eval-after-load 'org
  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'org-mode-hook 'turn-on-flyspell))

(defun oj ()
  "Create a Journal entry and open emacs to it"
  (interactive)
  (shell-command "cj")
  (find-file (concat "~/.journal/" (format-time-string "%Y-%m-%d") ".org")))

;; Turn on adaptive-wrap whenever visual-line-mode is turned
;; Source: https://stackoverflow.com/a/13561223
(when (fboundp 'adaptive-wrap-prefix-mode)
  (defun my-activate-adaptive-wrap-prefix-mode ()
    "Toggle `visual-line-mode' and `adaptive-wrap-prefix-mode' simultaneously."
    (adaptive-wrap-prefix-mode (if visual-line-mode 1 -1)))
  (add-hook 'visual-line-mode-hook 'my-activate-adaptive-wrap-prefix-mode))

;; Default AUCTex config
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; Inhibit startup screen
(setq inhibit-startup-screen t)

;; cider stuff
(setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (adaptive-wrap smooth-scroll centered-cursor-mode cider clojure-mode matlab-mode monokai-theme exec-path-from-shell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
