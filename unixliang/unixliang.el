


(prefer-coding-system 'utf-8)
(prefer-coding-system 'gb2312)

(setq tab-width 4)

;; start org
;自动缩排
(setq org-startup-indented t)
;时间统计
(setq org-todo-keywords
      '((sequence "DOING(i!)" "|" "HANGUP(h!)" "DONE(d!)" )))
;; end org


;; start smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; end smex




;; start helm-gtags/auto-complete
(global-set-key (kbd "C-]") 'helm-gtags-find-tag-from-here)
(global-set-key (kbd "C-t") 'helm-gtags-pop-stack)
(global-set-key (kbd "C-c r") 'helm-gtags-find-rtag)
(global-set-key (kbd "C-c f") 'helm-gtags-find-files)
(global-set-key (kbd "C-c e") 'helm-gtags-find-pattern)
(global-set-key (kbd "C-c s") 'helm-gtags-find-symbol)
(global-set-key (kbd "C-c t") 'helm-gtags-find-tag)
(require 'helm-gtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (linum-mode 1)
              (setq linum-format "%d ")
              (helm-gtags-mode 1)
              (auto-complete-mode 1))))
;; end helm-gtags/auto-complete



;; start feng-fighlight
(require 'feng-highlight)
(global-set-key (kbd "M-i") 'feng-highlight-at-point)
(global-set-key (kbd "M-I") 'feng-highlight-clear)
;; end feng-fighlight



;; start Indenting C/C++
(setq c-default-style "linux"
      c-basic-offset 4)
;; end Indenting C/C++


;; start forbidon old find file
(global-set-key (kbd "C-x f") 'ido-find-file)
(setq ido-use-filename-at-point nil) ;ignore file-at-point when invoking `ido-find-file` (`C-x C-f` in Ido mode)
;; end forbidon old find file


;; start smooth-scrilling
(require 'smooth-scrolling)
;; end smooth-scrilling

;; start org code block
(require 'ob-C)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (sh . t)
   (C . t)))
;; end org code block


;; start undo key binding
(global-set-key (kbd "C-z") 'undo) 
;; end undo key binding

;; start env setting

; ensure environment variables inside Emacs look the same as in the user's shell

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(setenv "MM" "/Users/unixliang/src/weixin/MicroMsg/")
(setenv "MMM" "/Users/unixliang/src/weixin/MicroMsg/micromsg/")
(setenv "MMMS" "/Users/unixliang/src/weixin/MicroMsg/micromsg/mmlogicsvr/")
(setenv "MMG" "/Users/unixliang/src/weixin/MicroMsg/mmgateway/")
;; end env setting



; start gnu emacs setting
(tool-bar-mode 0)
(scroll-bar-mode 0)
(set-default-font "Consolas 12")
; end gnu emacs setting
