;Tab indent 4 spaces
(setq c-basic-offset 4)

;Use c++ mode to open h file
(add-to-list 'auto-mode-alist (cons "\\.h\\'" 'c++-mode))

(setq compilation-scroll-output t)

;C/C++ Programming Enviroment
(setq c-default-style
      '((java-mode . "java") (awk-mode . "awk") (other . "linux")))

;(define-key gtags-mode-map "\C-xg" 'ac-complete-gtags)

(add-hook 'java-mode-hook '(lambda () (ggtags-mode 1) ))

(defun c-init-hook ()
  (ggtags-mode 1)
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
)

(add-hook 'c++-mode-hook 'c-init-hook)
(add-hook 'c-mode-hook 'c-init-hook)
(add-hook 'cc-mode-hook 'c-init-hook)

(require 'json)
