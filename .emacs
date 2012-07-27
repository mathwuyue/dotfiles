;;;;cedet
(load-file "~/.emacs.d/site/cedet-1.1/common/cedet.el")

;;-*- Emacs-Lisp -*-
;; Time-stamp:<2011-06-18 2:10 by Zhanpeng Chen
;;=============load-path==================
(add-to-list 'load-path "~/.emacs.d/site/")
;;=============一些缺省设置================
;;Emacs默认窗口大小和位置
(setq default-frame-alist
      '((height . 34)(width . 100)(top . 30)(left . 30)
))
;;关闭出错提示声
(setq visible-bell t)
;;关闭启动时到“开机画面”
(setq inhibit-startup-message t)
;;显示列号
(setq column-number-mode t)
;;显示行数
(global-linum-mode 1)
;;Tab-setting
(setq indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default py-indent-offset 4)
(setq-default c-basic-offset 8)
;;不要在鼠标点击的那个地方插入剪贴板内容
;;(setq mouse-yank-at-point t)
;;显示80列就换行
(add-hook 'message-mode-hook (lambda ()
(setq default-fill-column 80) 
(turn-on-auto-fill)))

;;设在sentence-end可以识别中文标点
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;可以递归的使用minibuffer
(setq enable-recursive-minibuffers t)
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文
(setq scroll-margin 3
      scroll-conservatively 10000)
;;设置缺省模式为text mode
(setq default-major-mode 'text-mode)
;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;在标题栏显示buffer到名字
(setq frame-title-format "emacs@%b")
;;让Emacs直接显示图片
(auto-image-file-mode)
;;语法高亮
(global-font-lock-mode t)
;;设置有用的个人信息
(setq user-full-name "Chen Zhanpeng")
(setq user-mail-address "lowstz@gmail.com")
;;关闭工具栏,菜单栏,滚动条
(tool-bar-mode nil)
;;(menu-bar-mode nil)
;;(scroll-bar-mode -1)
(scroll-bar-mode t)
;;把这些缺省禁用的功能打开
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)
(setq show-paren-mode t)

;; autopair
(require 'autopair)
(autopair-global-mode)

;;multi-term-mode
(require 'multi-term)

(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)

(setq multi-term-program "/bin/bash")
(set-default 'autopair-dont-activate #'(lambda ()
					 (eq major-mode 'term-mode)))
;; handy keybindings:
(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term)
(add-hook 'term-mode-hook (lambda ()
                            (define-key term-raw-map (kbd "C-y") 'term-paste)))
(defun term-mode-settings ()
  "Settings for `term-mode'"
  ;; emacs gui版本如果不把scroll-margin设为0
  ;; 当光标最屏幕底部时，有可能使得屏幕发生抖动
  (make-local-variable 'scroll-margin)
  (setq-default scroll-margin 0))

(add-hook 'term-mode-hook 'term-mode-settings)
;;;;


       ;; foreground color (yellow)
;;emacs-tramp
(require 'tramp)
;;tabbar-mode
(add-to-list 'load-path "~/.emacs.d/site/tabbar/")
;;speedbar-setting

;;Emacs主题高亮
;; (require 'color-theme)
;; (require 'color-theme-solarized)
;; (color-theme-initialize)
;; (color-theme-solarized-dark)
( add-to-list 'load-path "~/.emacs.d/site/emacs-color-theme-solarized/")
(require 'color-theme-solarized)
;;(color-theme-solarized-dark)
(if window-system 
   	(color-theme-solarized-dark)
  ())


;;===代码折叠=======
(add-hook 'c-mode-hook 'hs-minor-mode)
;;===backup-setting===
(setq make-backup-files nil)
(setq backup-directory-alist(quote(("." . "~/.backup"))))
;;===cc-mode=========
(require 'cc-mode)
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'c-mode 'set-newline-and-indent)
;;====compile=======
(require 'smart-compile)
;;(define-key c-mode-base-map [(f7)] 'compile)
(global-set-key [f7] 'smart-compile)
;;====org-mode======
(add-to-list 'load-path "~/.emacs.d/site/org-mode/lisp")
(add-to-list 'load-path "/home/lowstz/.emacs.d/site/org-mode/contrib/lisp")
(require 'org-install)
(require 'htmlize)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-publish-project-alist
      '(("note-org"
         :base-directory "~/Dropbox/org/wiki"
         :publishing-directory "/ssh:lowstz@lowstz.org#2222:~/wwwroot/wiki"
	 :htmlized-source t
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-sitemap t
		 :sitemap-filename "index.org"
		 :sitemap-title "Lowstz's Wiki"
         :link-home "index.html"
         :section-numbers nil
         :style "<link rel=\"stylesheet\"   href=\"/wiki/org.css\" type=\"text/css\"/>")
        ("note-static"
         :base-directory "~/Dropbox/org/wiki"
         :publishing-directory "/ssh:lowstz@lowstz.org#2222:~/wwwroot/wiki"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note" 
         :components ("note-org" "note-static")
         :author "lowstz@gmail.com"
         )))
;;;;;;Org-mode function
;;
;;=====org-mode-end======================

;;ruby-mode-setting
(add-to-list 'load-path "~/.emacs.d/site/ruby")
(autoload 'ruby-mode "ruby-mode"
     "Mode for editing ruby source files")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby"
    "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
    "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
   '(lambda ()
        (inf-ruby-keys)))
;; If you have Emacs 19.2x or older, use rubydb2x                             
(autoload 'rubydb "rubydb3x" "Ruby debugger" t)
;; uncomment the next line if you want syntax highlighting                    
(add-hook 'ruby-mode-hook 'turn-on-font-lock)

;;font-setting



;;python-mode-setting
(add-to-list 'load-path "~/.emacs.d/site/python-mode/")
(setq py-install-directory "~/.emacs.d/site/python-mode/")
(require 'python-mode)


;; ido-mode
(require 'ido)
(ido-mode t)

;; lua-mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;tabbar-setting
(require 'tabbar)
(tabbar-mode t)
(global-set-key [(meta j)] 'tabbar-backward)  
(global-set-key [(meta k)] 'tabbar-forward)

;; change faces for better-looking tabs (and more obvious selected tab!)
;; full face specification to avoid inheriting from the frame font
;; or from mode-line
(set-face-attribute 'tabbar-default nil
		    :inherit nil
		    :height 110
		    :weight 'normal
		    :width 'normal
		    :slant 'normal
		    :underline nil
		    :strike-through nil
;; inherit from frame		    :inverse-video
		    :stipple nil
		    :background "gray55"
		    :foreground "gray55"
;;		    :box '(:line-width 2 :color "white" :style nil)
		    :box nil
		    :family "Lucida Grande")

(set-face-attribute 'tabbar-selected nil
		    :background "gray95"
		    :foreground "gray20"
		    :inherit 'tabbar-default
		    :box '(:line-width 1 :color "grey95" :style nil))
;; 		    :box '(:line-width 2 :color "white" :style released-button))

(set-face-attribute 'tabbar-unselected nil
		    :inherit 'tabbar-default
		    :background "gray80"
		    :box '(:line-width 1 :color "grey80" :style nil))

(defface tabbar-selected-highlight '((t
		    :foreground "black"
		    :background "gray95"))
  "Face for selected, highlighted tabs."
  :group 'tabbar)

(defface tabbar-unselected-highlight '((t
                    :foreground "black"
		    :background "grey75"
		    :box (:line-width 3 :color "grey75" :style nil)))
  "Face for unselected, highlighted tabs."
  :group 'tabbar)

(set-face-attribute 'tabbar-button nil
		    :inherit 'tabbar-default
		    :box nil)

(set-face-attribute 'tabbar-separator nil
		    :background "grey50"
 		    :foreground "grey50"
		    :height 1)

(setq tabbar-separator '(0.8)) ;; set tabbar-separator size to 1 pixel

(defface tabbar-selected-modified
  '((t
     :inherit tabbar-selected
     :weight bold
     :height 100
     ))
  "Face used for unselected tabs."
  :group 'tabbar)

(defface tabbar-unselected-modified
  '((t
     :inherit tabbar-unselected
     :weight bold
     :height 100
     ))
  "Face used for unselected tabs."
  :group 'tabbar)

(defface tabbar-key-binding '((t
				 :foreground "white"))
    "Face for unselected, highlighted tabs."
    :group 'tabbar)

;; ibus-mode
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-off)
;;;; tramp-setting
(require 'tramp)
;;



 ;;;; ECB-mode
(setq stack-trace-on-error t)
(add-to-list 'load-path "~/.emacs.d/site/ecb-snap")
(require 'ecb)
(ecb-byte-compile)
(global-set-key [f9] 'ecb-activate)
(global-set-key [f10] 'ecb-deactivate)
(setq ecb-tip-of-the-day nil 
 	  ecb-tree-indent 4 
 	  ecb-windows-height 0.5 
	  ecb-windows-width 0.20
 	  ecb-auto-compatibility-check nil 
	  ecb-version-check nil)

;;;; auto-insert
(add-hook 'find-file-hooks 'auto-insert)
(auto-insert-mode 1)
(define-auto-insert 'sh-mode '(nil "#!/bin/bash\n\n"))
(define-auto-insert 'python-mode '(nil "#!/usr/bin/env python\n# -*- coding: utf-8 -*-\n\n"))

;;;; cscope
(add-hook 'c-mode-common-hook '(lambda() (require 'xcscope)))
          

;;;; yasnippet
 (add-to-list 'load-path
               "~/.emacs.d/site/yasnippet")
 (require 'yasnippet) ;; not yasnippet-bundle
 (yas/initialize)
 (yas/load-directory "~/.emacs.d/site/yasnippet/snippets")

;;;; auto-complete
(add-to-list 'load-path "/home/lowstz/.emacs.d/site/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/lowstz/.emacs.d/site/ac-dict")
(ac-config-default)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 113 :width normal))))
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

;;; Always do syntax highlighting
(global-font-lock-mode 1)

;;; Also highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;;; This is the binary name of my scheme implementation
(setq scheme-program-name "scm")

;;;; buffer size global-key
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook (quote (executable-make-buffer-file-executable-if-script-p)))
 '(auto-insert-directory "~/.emacs.d/insert/")
 '(column-number-mode t)
 '(ecb-auto-expand-tag-tree (quote all))
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(mumamo-chunk-coloring 1)
 '(nxhtml-default-encoding (quote utf-8))
 '(org-agenda-export-html-style "<link rel=\"stylesheet\" href=\"wiki/org.css\" type=\"text/css\" />")
 '(org-export-html-coding-system nil)
 '(org-export-html-mathjax-template "")
 '(org-export-html-style-include-default nil)
 '(org-export-html-style-include-scripts nil)
 '(py-shebang-startstring "#!/usr/bin/env")
 '(py-shell-name "ipython")
 '(py-shell-toggle-1 "ipython")
 '(py-start-run-py-shell t)
 '(smart-compile-alist (quote ((emacs-lisp-mode emacs-lisp-byte-compile) (html-mode browse-url-of-buffer) (nxhtml-mode browse-url-of-buffer) (html-helper-mode browse-url-of-buffer) (octave-mode run-octave) ("\\.c\\'" . "gcc -Wall -O2 %f -lm -o %n") ("\\.[Cc]+[Pp]*\\'" . "g++ -O2 %f -lm -o %n") ("\\.m\\'" . "gcc -O2 %f -lobjc -lpthread -o %n -std=c99") ("\\.java\\'" . "javac %f") ("\\.php\\'" . "php -l %f") ("\\.f90\\'" . "gfortran %f -o %n") ("\\.[Ff]\\'" . "gfortran %f -o %n") ("\\.cron\\(tab\\)?\\'" . "crontab %f") ("\\.tex\\'" tex-file) ("\\.texi\\'" . "makeinfo %f") ("\\.mp\\'" . "mptopdf %f") ("\\.pl\\'" . "perl -cw %f") ("\\.rb\\'" . "ruby -cw %f"))))
 '(speedbar-show-unknown-files t)
 '(tabbar-background-color "light gray")
 '(term-default-bg-color "#042028")
 '(term-default-fg-color "#eeeeee")
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(truncate-partial-width-windows nil))

(add-to-list 'load-path "~/.emacs.d/site/emacs-powerline")
(require 'powerline)
(setq powerline-arrow-shape 'arrow14)

(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)


