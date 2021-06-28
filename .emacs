(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(wombat))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(package-selected-packages '(elpy excorporate material-theme better-defaults))
 '(safe-local-variable-values '((eval setq org-confirm-babel-evaluate nil)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a")))
 '(vc-annotate-very-old-color nil))

;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http:/orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpa" . "http:/elpa.gnu.org/packages/") t) 

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; installs packages
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    elpy                                   ;; Emacs Lisp Python Environment
    flycheck                            ;; On the fly syntax checking
    blacken                              ;; format python code on save
    py-autopep8                       ;; Run autopep8 on save
    material-theme                   ;; Theme
    excorporate                       ;; MS Outlook integration
    ein                                      ;; Emacs IPython Notebook
    transpose-frame                 ;; transpose frames
    magit                                   ;; git integration
    use-package                         ;; :shrug:
    command-log-mode              ;; toggle keyboard command logging
    ivy                                       ;; command completion framework?
    counsel                                ;; useful UI for interactive features
    doom-modeline                    ;; make the modeline look pretty
    all-the-icons                   ;; cool icons, used with doom
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(setq inhibit-startup-message t)    ;; Hide the startup message
(global-linum-mode t)               ;; Enable line numbers globally
(when (eq system-type 'windows-nt)        ;; cross platform setup
  (setenv "Home" (getenv "UserProfile"))) ;; set HOME variable
(setq tab-width 4)                  ;; set tab width

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)       ; Give some breathing room

;; setup the visual bell
(setq visible-bell t)

;; quick start tramp - windows only
(setq tramp-default-method "plink")

;; enable transpose windows
(require 'transpose-frame)

;; set path to zip.exe for exporting
(setq exec-path (append exec-path '("C:/Users/corrlea/Downloads/unzip-5.51-1-bin/bin")))
(setq exec-path (append exec-path '("C:/Users/corrlea/Downloads/zip-3.0-bin/bin")))

;; make the modeline pretty
;; (require 'doom-modeline)
;; (doom-modeline-mode 1)

;; ;; load the icons
;; (require 'all-the-icons)

;; enable command-log-mode *remember to use global-command-log-mod
(require 'command-log-mode)

;; load theme
(load-theme 'material t)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ivy and Counsel Config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-mini-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; exit the minibuffer with the selected candidate
;; ivy-alt-done

;; cycle past last/first entries in ivy buffer
(setq ivy-wrap t)

;; adjust height of ivy minibuffer
;; (setq ivy-height 10)

(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

;; Enable org mode
(require 'org)

;; prevent the annoying autoformatting for source code blocks
(setq org-src-preserve-indentation t)

;; make code have same indentation as the headers
(setq org-edit-src-content-indentation 0)

;; disable the system from asking to confirm code execution
(setq org-confirm-babel-evaluate nil)

;; add timestamp when TODO is DONE
(setq org-log-done 'time)

;; allow alphabets when using lists
(setq org-list-allow-alphabetical t)

;; turn on indent mode on startup
(setq org-startup-indented 't)

;; keep org-adapt-indentation on (ie, increase indentation after a header)
(setq org-indent-mode-turns-off-org-adapt-indentation t) 

;; set image width to 1000, unless specified otherwise
(setq org-image-actual-width '1000) 

;; show inline images on startup
(setq org-startup-with-inline-images 't) 

;; Enable transient mark mode
(transient-mark-mode 1)

;; add org files for agenda
(setq org-agenda-files
      (append
           (file-expand-wildcards "~/org/*.org")
           (file-expand-wildcards "~/org/tickets/*.org")
       )
)

;; include entries from diary into agenda
(setq org-agenda-include-diary t)

(add-hook 'org-mode-hook #'toggle-truncate-lines)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; enable language-specific code execution in code blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (sql . t)
   (emacs-lisp . t)))

;; use 'conf-unix' header for dotfiles
(push '("conf-unix" . conf-unix) org-src-lang-modes)

;; implement structure templates
(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("sql" . "src sql"))

;; custom structure template
;; example @ https://emacs.stackexchange.com/questions/51384/config-easy-template-src-code-in-0rg-9-2/51411#51411
(tempo-define-template "conf for dotfiles" ; just some name for the template
	   '("#+begin_src conf-unix :mkdirp yes :tangle ~/dotfiles/?" p n
             "#+end_src")
           "<conf"
           "Used to create dotfiles" ; documentation
           'org-tempo-tags)

;; Automatically tangle our Emacs.org config file when we save it

(defun efs/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "c:/Users/corrlea/AppData/Roaming/emacs_conf.org"))
    ;; Dynamic scoping to the rescue
    (org-babel-tangle)))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'efs/org-babel-tangle-config)))

;; set idle timer to stop timer if AFK for too long
(setq org-clock-idle-time 15)

(define-key org-mode-map "\M-n" 'org-metaleft)
(define-key org-mode-map "\M-p" 'org-metaright)

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

;; explicitly allow undoing of cells
(setq ein:worksheet-enable-undo 't)
