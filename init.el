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
                      centered-cursor-mode))

;; install packages
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; initialization
(exec-path-from-shell-initialize)
(load-theme 'monokai t)
(add-hook 'org-mode-hook 'turn-on-flyspell)

;; cider stuff
(setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
