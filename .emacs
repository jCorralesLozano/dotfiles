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
     (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
     (add-to-list 'package-archives '("org" . "https:/orgmode.org/elpa/") t)
     (add-to-list 'package-archives '("elpa" . "https:/elpa.gnu.org/packages/") t) 

     ;; Initializes the package infrastructure
     (package-initialize)

     ;; If there are no archived package contents, refresh them
     (when (not package-archive-contents)
       (package-refresh-contents))

     ;; installs packages
     ;; myPackages contains a list of package names
     (defvar myPackages
       '(better-defaults                 ;; Set up some better Emacs defaults
	 gnu-elpa-keyring-update             ;; ensure keyring is up to date
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
	 doom-themes
	 all-the-icons                   ;; cool icons, used with doom
	 org-roam
     org-roam-ui
;     org-ql
	 ledger-mode
	 treemacs                       ;; file tree for code projects
	 vue-mode
	 web-mode
	 lsp-ui
	 lsp-mode
	 company
	 emmet-mode
	 org-chef
	 )
       )

     ;; Note: run package-refresh-contents if a package is not installing

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
(display-line-numbers-mode t)               ;; Enable line numbers globally
(when (eq system-type 'windows-nt)        ;; cross platform setup
  (setenv "Home" (getenv "UserProfile"))) ;; set HOME variable
(setq tab-width 4)                  ;; set tab width

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)       ; Give some breathing room

;; setup the visual bell
(setq visible-bell t)

;; enable transpose windows
(require 'transpose-frame)

;; set path to zip.exe for exporting
(setq exec-path (append exec-path '("C:/Users/corrlea/Downloads/unzip-5.51-1-bin/bin")))
(setq exec-path (append exec-path '("C:/Users/corrlea/Downloads/zip-3.0-bin/bin")))

;; make the modeline pretty
(require 'doom-modeline)
(doom-modeline-mode 1)

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

;; Set tab width to 4 spaces (adjust as needed)
(add-hook 'html-mode-hook
          (lambda ()
            (setq-local sgml-basic-offset 4)))
(add-hook 'css-mode-hook
          (lambda ()
            (setq-local sgml-basic-offset 4)))

(require 'tramp)
;; quick start tramp - windows only
(setq tramp-default-method "plink")

;; set default user
(setq tramp-default-user "corrlea")

;; set default host
(setq tramp-default-host "dev-dsk-corrlea-1e-d2040f56.us-east-1.amazon.com")

;; add in bin directorys to use Amazon tooling specific commands such as brazil-build, ada, odin, etc
(add-to-list 'tramp-remote-path "/apollo/env/AAAWorkspaceSupport/bin")
(add-to-list 'tramp-remote-path "/apollo/env/ApolloCommandLine/bin")
(add-to-list 'tramp-remote-path "/apollo/env/BarkCLI/bin")
(add-to-list 'tramp-remote-path "/apollo/env/DevDesktopAL2/bin")
(add-to-list 'tramp-remote-path "/apollo/env/DJSAgent_MultiRegionConsumed/bin")
(add-to-list 'tramp-remote-path "/apollo/env/envImprovement/bin")
(add-to-list 'tramp-remote-path "/apollo/env/NawsEnumeration/bin")
(add-to-list 'tramp-remote-path "/apollo/env/OdinTools/bin")
(add-to-list 'tramp-remote-path "/apollo/env/PyAmznCertMetrics/bin")
(add-to-list 'tramp-remote-path "/apollo/env/RemoteOverrideSupport/bin")
;; toolbox binaries don't seem to work, but they all contain pointers to another directory
(add-to-list 'tramp-remote-path "/home/corrlea/.toolbox/bin")
(add-to-list 'tramp-remote-path "/home/corrlea/.toolbox/tools/toolbox/1.1.1531.0/toolbox-exec")

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

;; Add directorys for org-roam-directory
(setq org-directory
      (append
           (file-expand-wildcards "~/org-roam/*.org")
           (file-expand-wildcards "~/org-roam/daily/*.org")
       )
)

(defun my/org-roam-capture-template ()
  "Capture template for Org Roam nodes."
  (let ((id (org-id-new))
        (date (format-time-string "%Y-%m-%d")))
    (concat "* " date " %<%I:%M %p> "  (read-string "Heading: ") "\n" 
            ":PROPERTIES:\n"
            ":DATE: " date "\n"
	    ":PROJECT: " (read-string "Project: ") "\n" 
            ":END:\n"
	          "** Agenda | Purpose\n** Notes\n** Action Items\n** Questions\n** Decisions"
            "%?")))

(defun my/org-capture-finalize-hook ()
  "Custom function to run after `org-capture-finalize`."
  (let* ((buf (marker-buffer org-capture-last-stored-marker))
         (file (buffer-file-name buf))
         (project (with-current-buffer buf
                    (save-excursion
                      (goto-char (point-max))
                      (when (re-search-backward "^:PROJECT: \\(.+\\)" nil t)
                        (match-string 1)))))
         (heading (with-current-buffer buf
                    (save-excursion
                      (goto-char (point-max))
                      (when (re-search-backward "^\\*\\s-+\\(.*\\)" nil t)
                        (match-string 1)))))
         (contents (with-current-buffer buf
                     (get-contents-under-heading file heading))))
    (when (or (string= file "aws_work_meetings.org")
              (string= (buffer-name buf) "aws_work_meetings.org"))
      (message "Org capture finalized in buffer: %s, file: %s, Project: %s, Heading: %s, Contents: %s" buf file project heading contents)
      (my/insert-subheading-under-meetings heading project contents))))

(add-hook 'org-capture-after-finalize-hook 'my/org-capture-finalize-hook)

(defun get-contents-under-heading (file-path heading-title)
  "Return the contents under the specified heading in FILE-PATH."
  (with-temp-buffer
    (insert-file-contents file-path)
    (goto-char (point-min))
    (let ((contents "")
          (found nil))
      (while (re-search-forward (format "^\\*+ %s$" (regexp-quote heading-title)) nil t)
        (forward-line)
        (while (not (or (eobp) (looking-at "^\\* ")))
          (setq contents (concat contents (buffer-substring (point) (line-end-position))) )
          (forward-line))
        (setq found t))
      (if found
          contents
        (message "Heading not found: %s" heading-title)
        nil))))

(defun my/insert-subheading-under-meetings (h p c)
  "Inserts string CONTENTS as a new subheading with title H under the * Meetings heading of Org Roam node P."
  (with-current-buffer (org-roam-node-find-file p)
    (goto-char (point-min))
    (if (re-search-forward "^\\* Meetings" nil t)
        (progn
          (org-end-of-subtree)
          (insert (format "\n* %s\n%s" h c))
          (org-indent-line)
          (save-buffer))
      (progn
        (goto-char (point-min))
        (insert "* Meetings\n")
        (insert (format "\n* %s\n%s" h c))
        (org-indent-line)
        (save-buffer)))))

(defun get-node-id (project)
  "Return the node ID of the Org Roam node with the specified PROJECT title."
  (let ((node-id (car (org-roam-db-query
                        [:select [id]
                         :from nodes
                         :where (ilike title $s1)]
                        project))))
    (if node-id
        node-id
      (car (org-roam-db-query
            [:select [node_id]
             :from aliases
             :where (ilike alias $s1)]
            project)))))

;; ACK that we are using v2, not v1, and no migration steps are necessary
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org-roam")
  (org-roam-completion-everywhere t)
  (org-roam-dailies-capture-templates
   '(("d" "default" entry "* %<%I:%M %p>: %?"
       :if-new (file+head "%<%Y-%m-%d>.org" "[[id:46e38d27-6940-45ab-96ab-89456e79bed2][Journal]]\n#+title: %<%Y-%m-%d>\n"))
     ("m" "Morning Entry" entry "* Morning Entry\n** Tasks\n+ %?\n** What Are You Grateful For?\n+ \n** Daily Affirmations\n+ \n** What are your goals for today?\n+ \n** What are you worried about?\n+ \n** What are you excited for?\n+ \n** Ideas\n"
         :if-new (file+head "%<%Y-%m-%d>.org" "[[id:46e38d27-6940-45ab-96ab-89456e79bed2][Journal]]\n#+title: %<%Y-%m-%d>\n"))
     ("e" "Evening Entry" entry "* Evening Entry\n** What Are You Grateful For?\n%?\n** How was the progress towards your goals?\n** Thoughts on the day?\n** Lessons Learned\n** Ideas"
         :if-new (file+head "%<%Y-%m-%d>.org" "[[id:46e38d27-6940-45ab-96ab-89456e79bed2][Journal]]\n#+title: %<%Y-%m-%d>\n"))
     ("w" "Work Meeting Entry" entry (function my/org-roam-capture-template)
         :if-new (file+head "aws_work_meetings.org" ""))))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

;; (setq org-roam-directory (file-truename "~/org-roam"))

;; setup Org-roam to run functions on file changes to maintain cache consistency
;;(org-roam-db-autosync-mode)

(use-package org-roam-ui
;;  :straight
  ;;  (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
    :after org-roam
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t)
)

;(require 'org-ql)

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
   (emacs-lisp . t)
   (shell . t)))

;; use 'conf-unix' header for dotfiles
(push '("conf-unix" . conf-unix) org-src-lang-modes)

;; implement structure templates
(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("sql" . "src sql"))
(add-to-list 'org-structure-template-alist '("sh" . "src bash"))

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

(setq org-clock-mode-line-total 'today)

(define-key org-mode-map "\M-n" 'org-metaleft)
(define-key org-mode-map "\M-p" 'org-metaright)

(require 'org-chef)

(setq org-capture-templates
      '(("c" "Cookbook" entry (file "~/org-roam/20250108104857-cookbook.org")
         "%(org-chef-get-recipe-from-url)"
         :empty-lines 1)
        ("m" "Manual Cookbook" entry (file "~/org-roam/20250108104857-cookbook.org")
         "* %^{Recipe title: }\n  :PROPERTIES:\n  :source-url:\n  :servings:\n  :prep-time:\n  :cook-time:\n  :ready-in:\n  :END:\n** Ingredients\n   %?\n** Directions\n\n")))

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

(require 'treemacs)
(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key (kbd "C-x t 1") 'treemacs-delete-other-windows)
(global-set-key (kbd "C-x t t") 'treemacs)
(global-set-key (kbd "C-x t B") 'treemacs-bookmark)
(global-set-key (kbd "C-x t C-t") 'treemacs-find-file)
(global-set-key (kbd "C-x t M-t") 'treemacs-find-tag)

(setq treemacs-follow-mode t)
(setq treemacs-filewatch-mode t)
(setq treemacs-git-mode 'deferred)
(treemacs-follow-mode t)
(treemacs-filewatch-mode t)
(treemacs-fringe-indicator-mode 'always)

;; Enable vue-mode for .vue files
(require 'vue-mode)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))

;; Configure web-mode for better Vue.js support
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-enable-auto-closing t) ;; Automatically close tags
  (setq web-mode-enable-auto-quoting t)) ;; Automatically add quotes for attributes
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; Enable lsp-mode for vue-mode
(add-hook 'vue-mode-hook #'lsp)
(add-hook 'web-mode-hook #'lsp)

;; Configure lsp-mode
(require 'lsp-mode)
(setq lsp-prefer-flymake nil) ;; Use lsp-ui and flycheck instead of flymake

;; Configure lsp-ui for better UI integration
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; Company mode for code completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Enable emmet-mode for Vue.js files
(add-hook 'vue-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
