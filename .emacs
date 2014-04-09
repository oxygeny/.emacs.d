;(require 'server)
;(when (and (= emacs-major-version 23) (equal window-system 'w32))
;  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                 ; ~/.emacs.d/server is unsafe"
                                                 ; on windows.
;(server-start)

;;System Settings
;customize path
(setq elisp-path "~/.emacs.d/")
(add-to-list 'load-path elisp-path)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
)

;make buffers' name unique, add path info to name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;backup files to specific directory, keep five last versions
(setq version-control t)
(setq backup-directory-alist '((".*" . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" "~/.saves/\\2" t)))

;no starup message
(setq inhibit-startup-message t)

(ido-mode t)

(column-number-mode t)

;don't need menu-bar
(menu-bar-mode -1)

;disable version control
(setq vc-handled-backends nil)

;man all pages
(setq Man-switches "-a")

;;Display Settings
;hightlight files like ini,batch
(require 'generic-x)

;default in text-mode
(setq default-major-mode 'text-mode)

;default tab-width
(setq-default tab-width 4)

;(global-hl-line-mode t)

(setq-default truncate-lines t)

;括号配对
(show-paren-mode t)

;;Edit Settings
;indent using space
(setq-default indent-tabs-mode nil)

;enable del selection text
(delete-selection-mode t)

(icomplete-mode t)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;load X window special setting
(if (display-graphic-p) (load "xlisp") (load-theme 'wombat))

(load "develop")
(load "elisp")
(load "customkey")
