
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
(global-linum-mode t)
;;Tab-setting
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
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
(scroll-bar-mode nil)
;;把这些缺省禁用的功能打开
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)
;;multi-term-mode
(require 'multi-term)
(setq multi-term-program "/bin/bash")
(add-hook 'term-mode-hook (lambda ()
                            (define-key term-raw-map (kbd "C-y") 'term-paste)))
(add-hook 'term-mode-hook
  #'(lambda () (setq autopair-dont-activate t)))

(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(mumamo-chunk-coloring 1)
 '(nxhtml-default-encoding (quote utf-8))
 '(org-export-html-coding-system nil)
 '(org-export-html-mathjax-template "")
 '(org-export-html-style-include-default nil)
 '(org-export-html-style-include-scripts nil)
 '(py-shebang-startstring "#!/usr/bin/env")
 '(py-shell-name "ipython")
 '(py-shell-toggle-1 "ipython")
 '(py-start-run-py-shell t)
 '(show-paren-mode t)
 '(speedbar-show-unknown-files t)
 '(term-default-bg-color "#042028")
 '(term-default-fg-color "#eeeeee")
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(truncate-partial-width-windows nil))

       ;; foreground color (yellow)
;;emacs-tramp
(require 'tramp)
;;tabbar-mode
(add-to-list 'load-path "~/.emacs.d/site/tabbar/")
;;speedbar-setting

;;Emacs主题高亮
(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-initialize)
;;(color-theme-solarized-dark)
;;(load "color-theme")
(if window-system 
	(color-theme-solarized-dark)
  ())

;; ;;nxhtml-mode
;; (load "~/.emacs.d/site/nxhtml/autostart.el")
;; ;;Mumamo is making emacs 23.3 freak out:
;; (when (and (equal emacs-major-version 23)
;;              (equal emacs-minor-version 3))
;;     (eval-after-load "bytecomp"
;;       '(add-to-list 'byte-compile-not-obsolete-vars
;;                     'font-lock-beginning-of-syntax-function))
;; ;; ;;   tramp-compat.el clobbers this variable!
;;     (eval-after-load "tramp-compat"
;;     '(add-to-list 'byte-compile-not-obsolete-vars
;;                  'font-lock-beginning-of-syntax-function)))
;;   (setq auto-mode-alist (cons '("\\.html$" . nxhtml-mode) auto-mode-alist))
 (add-hook 'html-mode-hook
           (lambda()
             (setq sgml-basic-offset 4)
             (setq indent-tabs-mode t)))
;;====autopair=====
(require 'autopair)
(autopair-global-mode)
(add-hook 'term-mode-hook
  #'(lambda () (setq autopair-dont-activate t)))
;;===代码折叠=======
(add-hook 'c-mode-hook 'hs-minor-mode)
;;===backup-setting===
(setq make-backup-files nil)
(setq backup-directory-alist(quote(("." . "~/.backup"))))
;;===cc-mode=========
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)
;;====compile=======
(setq compile-command "make")
(define-key c-mode-base-map [(f7)] 'compile)
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
         :publishing-directory "~/wwwroot/wiki"
	 :htmlized-source t
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index t
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :section-numbers nil
         :style "<link rel=\"stylesheet\"   href=\"/wiki/org.css\" type=\"text/css\"/>")
        ("note-static"
         :base-directory "~/Dropbox/org/wiki"
         :publishing-directory "~/wwwroot/wiki"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note" 
         :components ("note-org" "note-static")
         :author "lowstz@gmail.com"
         )))

(require 'tramp)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-export-html-style "<link rel=\"stylesheet\" href=\"wiki/org.css\" type=\"text/css\" />")
 '(org-export-html-mathjax-template "")
 '(org-export-html-style-include-default nil)
 '(org-export-html-style-include-scripts nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#042028" :foreground "#708183" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "Monaco")))))


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
		    :background "gray80"
		    :foreground "black"
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
     :height 110
     ))
  "Face used for unselected tabs."
  :group 'tabbar)

(defface tabbar-unselected-modified
  '((t
     :inherit tabbar-unselected
     :weight bold
     :height 110
     ))
  "Face used for unselected tabs."
  :group 'tabbar)

(defface tabbar-key-binding '((t
				 :foreground "white"))
    "Face for unselected, highlighted tabs."
    :group 'tabbar)
