;(setq debug-on-error t)

(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'gb18030)
(prefer-coding-system 'utf-8)


(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;; start org
;自动缩排
(setq org-startup-indented t)
;时间统计
(setq org-todo-keywords
      '((sequence "TODO(t!)" "|" "DONE(d!)" )))
;; end org


;; start smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; end smex




;; start helm-gtags
(global-set-key (kbd "C-]") 'helm-gtags-find-tag-from-here)
(global-set-key (kbd "C-t") 'helm-gtags-pop-stack)
(global-set-key (kbd "C-c r") 'helm-gtags-find-rtag)
(global-set-key (kbd "C-c f") 'helm-gtags-find-files)
(global-set-key (kbd "C-c e") 'helm-gtags-find-pattern)
(global-set-key (kbd "C-c s") 'helm-gtags-find-symbol)
(global-set-key (kbd "C-c t") 'helm-gtags-find-tag)

(defun helm-do-grep-recursive (&optional non-recursive)
  "Like `helm-do-grep', but greps recursively by default."
  (interactive "P")
  (let* ((current-prefix-arg (not non-recursive))
         (helm-current-prefix-arg non-recursive))
    (call-interactively 'helm-do-grep)))
(global-set-key (kbd "C-c g") 'helm-do-grep-recursive)

(require 'sourcepair)
(setq sourcepair-source-path    '( "." "../*" ))
(setq sourcepair-header-path    '( "." "include" "../include" "../*"))
(setq sourcepair-recurse-ignore '( "CVS" "Obj" "Debug" "Release" ))
(global-set-key (kbd "C-c h") 'sourcepair-load) ;; jump between .h and .cpp
(global-set-key (kbd "C-c C-h") 'sourcepair-load) ;; prevent sourcepair-load opera err


(require 'helm-gtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (linum-mode 1)
              (setq linum-format "%d ")
              (helm-gtags-mode 1)
              )))
;; end helm-gtags






(require 'highlight-symbol)
(global-set-key (kbd "M-i") 'highlight-symbol)
(global-set-key (kbd "M-I") 'highlight-symbol-remove-all)


;; start Indenting C/C++
(setq c-default-style "linux"
      c-basic-offset 4)
;; end Indenting C/C++


;; start forbidon old find file
(global-set-key (kbd "C-x f") 'ido-find-file)
(setq ido-use-filename-at-point nil) ;ignore file-at-point when invoking `ido-find-file` (`C-x C-f` in Ido mode)
;; end forbidon old find file


;; start smooth-scrilling
;(require 'smooth-scrolling)
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




(global-set-key (kbd "C-x l") 'helm-locate) 
(global-set-key (kbd "C-x g") 'helm-regexp) 


;; kill other buffer
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))
;; kill other buffer


(global-auto-revert-mode 1)


; (setq default-fill-column 100)


;; highlight selected windows
(set-face-attribute  'mode-line-inactive
                 nil 
                 :foreground "gray30"
                 :background "gray100" 
                 :box '(:line-width 1 :style released-button))
;; highlight selected windows




;; insert line before cur-line
(defun insert-prev-line ()
"insert a new indent line before current line, just like 'O' in vim"
(interactive)
(beginning-of-line)
(newline)
(previous-line)
(indent-for-tab-command)
)
;; insert line before cur-line

;; insert line after cur-line
(defun insert-next-line ()
"insert a new indent line after current line, just like 'o' in vim"
(interactive)
(end-of-line)
(newline)
)
;; insert line after cur-line

;(global-set-key (kbd "C-i") 'insert-prev-line)
;(global-set-key (kbd "C-o") 'insert-next-line)


;; make C-i act like C-x
;(keyboard-translate ?\C-i ?\C-x)
;; make C-i act like C-x

;; make C-o act like C-c
;(keyboard-translate ?\C-o ?\C-c)
;; make C-o act like C-c


;; replace system default M-x, support fuzzy match
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)
;; replace system default M-x, support fuzzy match


(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; replace system default C-x b, support fuzzy match
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t
      helm-buffer-max-length nil)
;; replace system default C-x b, support fuzzy match


(global-set-key (kbd "C-s") 'helm-occur)



;(eval-after-load "markdown-mode"
;  '(defalias 'markdown-add-xhtml-header-and-footer 'as/markdown-add-xhtml-header-and-footer))
(autoload 'markdown-mode "markdown-mode"
	"Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'". markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'". markdown-mode))


(setq scroll-preserve-screen-position t
      scroll-conservatively 0)

; uesless...
;(add-hook 'markdown-mode-hook (lambda () (setq auto-fill-mode nil)))
; useful!
(add-hook 'markdown-mode-hook (lambda () (auto-fill-mode 0)))


; split window horizontally (side-by-side) by default
; (setq helm-split-window-default-side 'right)
; (setq helm-split-window-default-side 'below)



;; gnu global
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (gtags-mode 1))))
(defun gtags-root-dir ()
  "Returns GTAGS root directory or nil if doesn't exist."
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))
(defun gtags-update-single(filename)  
  "Update Gtags database for changes in a single file"
  (interactive)
  (start-process "update-gtags" "update-gtags" "bash" "-c" (concat "cd " (gtags-root-dir) " ; gtags --single-update " filename )))
(defun gtags-update-current-file()
  (interactive)
  (defvar filename)
  (setq filename (replace-regexp-in-string (gtags-root-dir) "." (buffer-file-name (current-buffer))))
  (gtags-update-single filename)
  (message "Gtags updated for %s" filename))
(defun gtags-update-hook()
  "Update GTAGS file incrementally upon saving a file"
  (when gtags-mode
    (when (gtags-root-dir)
      (gtags-update-current-file))))
(add-hook 'after-save-hook 'gtags-update-hook)
;; gnu global


;; helm-imenu
(global-set-key (kbd "C-h") 'helm-imenu)
;; helm-imenu








;; company + irony

;(setq company-minimum-prefix-length 2)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; Define the modes/packages you need
(require 'company)
(require 'irony)
(require 'company-c-headers)

;; Enable company mode globally 
(global-company-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

;; company + irony



;; winner mode
;; for undo/redo windoes operator
(winner-mode 1)
