(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages '(excorporate material-theme better-defaults))
 '(safe-local-variable-values '((eval setq org-confirm-babel-evaluate nil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)  

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    blacken                         ;; format python code on save
    py-autopep8                     ;; Run autopep8 on save
    material-theme                  ;; Theme
    excorporate                     ;; MS Outlook integration
    ein                             ;; Emacs IPython Notebook
    transpose-frame                 ;; transpose frames
    magit                           ;; git integration
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; ===================================
;; Basic Customization
;; ===================================
(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally
(when (eq system-type 'windows-nt)        ;; cross platform setup
  (setenv "Home" (getenv "UserProfile"))) ;; set HOME variable
(setq tab-width 4)                  ;; set tab width

;; quick start tramp - windows only
(setq tramp-default-method "plink")

;; enable transpose windows
(require 'transpose-frame)

;; ====================================
;; Development Setup - Python
;; ====================================

;; Enable elpy
(elpy-enable)

;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; enable flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable blacken
(require 'blacken)
(add-hook 'elpy-mode-hook 'blacken-mode)

;; ====================================
;; Org Mode
;; ====================================

;; Enable Org mode
(require 'org)
(add-hook 'org-mode-hook #'toggle-truncate-lines)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; add org files for agenda
(setq org-agenda-files
      (append
           (file-expand-wildcards "~/org/*.org")
	   (file-expand-wildcards "~/org/tickets/*.org")
	   (file-expand-wildcards "~/Documents/Notes/*.org")
	   )
)

;; add timestamp when TODO is DONE
(setq org-log-done 'time)

;; allow alphabets when using lists
(setq org-list-allow-alphabetical t)

;; turn on indent mode on startup
(setq org-startup-indented 't)  

;;(setq org-indent-indentation-per-level '4) ;; set indent level to 4 spaces

;; keep org-adapt-indentation on
(setq org-indent-mode-turns-off-org-adapt-indentation nil) 

;; set image width to 1000, unless specified otherwise
(setq org-image-actual-width '1000) 

;; show inline images on startup
(setq org-startup-with-inline-images 't) 

;; Enable transient mark mode
(transient-mark-mode 1)

;; include entries from diary into agenda
(setq org-agenda-include-diary t)

;; ====================================
;; Key Bindings
;; ====================================

(load "C:/Users/corrlea/AppData/Roaming/keybindings")
;; User-Defined init.el ends here
