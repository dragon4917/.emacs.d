;; ------------------------- customize-operate-habit start -------------------------

;; 启动Emacs报错, ~/.emacs中有问题, 如何忽略错误
	; (condition-case err
		; (progn
		; (require 'xxx) )
	; (error
		; (message "Can't load xxx-mode %s" (cdr err))))
	; 如上所示, 可以截获progn内部出错, 在mini-buffer下打出错误信息

;; 在mozilla, openoffice等拷贝的中文文字无法正确粘贴在Emacs中(Emacs 21.3 发布版有此问题, 至少在我的FreeBSD下是这样的)
	; (set-clipboard-coding-system 'ctext)

;; 使用语法显示的大文件在移动时如此之慢（缓解办法）
	; (setq lazy-lock-defer-on-scrolling t)
	; (setq font-lock-support-mode 'lazy-lock-mode)
	; (setq font-lock-maximum-decoration t)

;; 显示匹配的括号
	(show-paren-mode t)

;; 高亮光标的当前行
	(global-hl-line-mode 1)

;; (暂未绑定快捷键) emacs里有将光标移动到当前行的行头(move-beginning-of-line)和行尾(move-end-of-line)的函数,但没有移动到当前行中间的函数
    (defun move-middle-of-line ()
		"Move point to the middle of line current displayed"
		(interactive)
		(message "move to middle of line, cur=%d." (current-column))
		(end-of-line)
		(backward-char (/ (current-column) 2)))

;; set open multi shell / 在一个emacs中打开多个shell buffer
    (defun wcy-shell-mode-auto-rename-buffer (text)
		(if (eq major-mode 'shell-mode)
			(rename-buffer  (concat "shell:" default-directory) t)))
    (add-hook 'comint-output-filter-functions'wcy-shell-mode-auto-rename-buffer)


;;设置打开文件的缺省路径
	; (setq default-directory "~/Workspaces/")
	; (setq default-directory "E:/daily/Workspaces/")  ; 目录一定要使用“/”，不然会出现乱码。
;;关闭出错时的提示声
	(setq visible-bell t)
;;	关闭启动时那个开机画面
	(setq inhibit-startup-message t)
;;关闭gnus启动时的画面
	(setq gnus-inhibit-startup-message t)
;;	在标题栏显示buffer的名字和大小，而不是默认的没用的显示
	; (setq frame-title-format "emacs@%b %I")
	; (setq frame-title-format "%b %I") ;显示文件名和大小
	;; 标题栏	就可以显示当前项目名，当前编辑文件的完整路径。
	; (setq frame-title-format
		; (list "[" '(:eval (projectile-project-name)) "]" "emacs@"
			; '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;;	show column/row number
	(global-linum-mode 'linum-mode)	;;	work
	; 显示当前所在的行号和列号
	(column-number-mode t)
	
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
	(setq scroll-margin 3 scroll-conservatively 10000)

;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
	(fset 'yes-or-no-p 'y-or-n-p)


;; 让Emacs在保存时自动清除行尾空格及文件结尾空行
	(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; 自动的在文件末增加一新行
	(setq require-final-newline t)

;; 实现org模式下自动换行（org模式下默认没有自动换行的功能）
	(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

	
;;当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况,此时加密显出你的密码
	(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
	
;;设置有用的个人信息,这在很多地方有用。
	; (setq user-full-name "XXXXXX")
	; (setq user-mail-address "XXXXXX@163.com")

;; set open multi shell / 在一个emacs中打开多个shell buffer(Not yet used)
    ; (defun wcy-shell-mode-auto-rename-buffer (text)
		; (if (eq major-mode 'shell-mode)
			; (rename-buffer  (concat "shell:" default-directory) t)))
    ; (add-hook 'comint-output-filter-functions'wcy-shell-mode-auto-rename-buffer)

;; Doing package-list-packages will also update the list of packages. 	
	(when (not package-archive-contents)
		(package-refresh-contents))

;; 隐藏折行箭头
	; (global-visual-line-mode 1)



	
	
	
	
;; (No shortcut key binding) emacs里有将光标移动到当前行的行头(move-beginning-of-line)和行尾(move-end-of-line)的函数,但没有移动到当前行中间的函数
    (defun move-middle-of-line ()
		"Move point to the middle of line current displayed"
		(interactive)
		(message "move to middle of line, cur=%d." (current-column))
		(end-of-line)
		(backward-char (/ (current-column) 2)))


; --------------------------customize-operate-habit-keybord--------------------------



;; 按 Ctrl-Alt-\ 对这块代码重新进行格式化。如果要粘贴一块代码的话，粘贴完了紧接着按 Ctrl-Alt-\ 就可以把新加入的代码格式化好。格式化操作 Emacs 应该可以将它自动化
	(dolist (command '(yank yank-pop))
		(eval
			`(defadvice ,command (after indent-region activate)
				(and (not current-prefix-arg)
					(member major-mode
						'(emacs-lisp-mode
							lisp-mode
							clojure-mode
							scheme-mode
							haskell-mode
							ruby-mode
							rspec-mode
							python-mode
							c-mode
							java-mode
							c++-mode
							objc-mode
							latex-mode
							js-mode
							js2-mode
							js3-mode
							html-mode
							css-mode
							plain-tex-mode))
					(let ((mark-even-if-inactive transient-mark-mode))
						(indent-region (region-beginning) (region-end) nil))))))




	;; Emacs的默认设置中，M-;可以起到注释的作用，但是有不方便的地方：必须在选中一部分区域后才能进行注释。通过如下配置，可以达到以下效果：当光标位于行尾时，M-;在行尾进行注释；当光标位于其他位置时，M-;起到注释该行的作用；当选中一部分区域时，M-;起到注释该区域的作用。
    (defun qiang-comment-dwim-line (&optional arg)
	"Replacement for the comment-dwim command.If no region is selected and current line is not blank and we are not at the end of the line,then comment current line.Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
		(interactive "*P")
		(comment-normalize-vars)
		(if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
			(comment-or-uncomment-region (line-beginning-position) (line-end-position))
			(comment-dwim arg)))
    (global-set-key "\M-;" 'qiang-comment-dwim-line)

;; C-SPACE 被输入法占用，C-@ 又太难按，于是把 set mark 绑定到 C-return
	(define-key global-map [C-return] 'set-mark-command)

; ------------------------------------------------------------
;; 当你没有选中一个区域的时候，C-w 会剪切光标所在行，不管光标的位置在哪里；而用 M-w 的时候，则会复制光标所在的行，不管光标的位置在行首还是行尾还是行中间的任意位置。当你有选中区域的时候，C-w 和 M-w 的功能和 Emacs 自带的没啥两样。
;; set new method of kill a whole line
	(defadvice kill-ring-save (before slickcopy activate compile)
		; "When called interactively with no active region, copy a single line instead."
		(interactive
			(if mark-active (list (region-beginning) (region-end))
				(list (line-beginning-position)
					(line-beginning-position 2)))))
	(defadvice kill-region (before slickcut activate compile)
		; "When called interactively with no active region, kill a single line instead."
		(interactive
			(if mark-active (list (region-beginning) (region-end))
				(list (line-beginning-position)
					(line-beginning-position 2)))))

;;格式化整个文件函数
	(defun indent-whole ()
		(interactive)
		(indent-region (point-min) (point-max))
		(message "format successfully"))
	;;绑定到F7键
	(global-set-key [f7] 'indent-whole)

	

;; 在行首 C-k 时，同时删除该行。
	; (setq-default kill-whole-line t)
;; 替换为：
;;; 把 Alt-k 设成复制光标所在处到行尾。与 kill-line 的 Ctrl-k 对应。这样一来，如果是要拷贝一整行的话，只要将光标移动到该行任意位置，按下 Alt-w 就行了。如果是复制某个位置到行尾的文字的话，就把光标移到起始位置处，按 Alt-k 。
	;; Smart copy, if no region active, it simply copy the current whole line
	(defadvice kill-line (before check-position activate)
	(if (member major-mode
				'(emacs-lisp-mode scheme-mode lisp-mode
									c-mode c++-mode objc-mode js-mode
									latex-mode plain-tex-mode))
		(if (and (eolp) (not (bolp)))
			(progn (forward-char 1)
					(just-one-space 0)
					(backward-char 1)))))

					
					
					
	(defadvice kill-ring-save (before slick-copy activate compile)
	"When called interactively with no active region, copy a single line instead."
	(interactive (if mark-active (list (region-beginning) (region-end))
					(message "Copied line")
					(list (line-beginning-position)
						(line-beginning-position 2)))))
	
	(defadvice kill-region (before slick-cut activate compile)
	"When called interactively with no active region, kill a single line instead."
	(interactive
	(if mark-active (list (region-beginning) (region-end))
		(list (line-beginning-position)
			(line-beginning-position 2)))))
	
	;; Copy line from point to the end, exclude the line break
	(defun qiang-copy-line (arg)
	"Copy lines (as many as prefix argument) in the kill ring"
	(interactive "p")
	(kill-ring-save (point)
					(line-end-position))
					;; (line-beginning-position (+ 1 arg)))
	(message "%d line%s copied" arg (if (= 1 arg) "" "s")))
	
	(global-set-key (kbd "M-k") 'qiang-copy-line)
	
	
	;; press '%' will point the other paren, otherwise insert '%'.	11:09 2017/1/24
	(global-set-key "%" 'match-paren)    
	(defun match-paren (arg)
		"Go to the matching paren if on a paren; otherwise insert %."
		(interactive "p")
		(cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
			((looking-at "\\s\)") (forward-char 1) (backward-list 1))
			(t (self-insert-command (or arg 1)))))
	
	
	;; 'C-c a' + char the point will go to the nth char.	11:09 2017/1/24
	(defun wy-go-to-char (n char)
		"Move forward to Nth occurence of CHAR.
		Typing `wy-go-to-char-key' again will move forwad to the next Nth
		occurence of CHAR."
		(interactive "p\ncGo to char: ")
		(search-forward (string char) nil nil n)
		(while (char-equal (read-char)
					char)
			(search-forward (string char) nil nil n))
		(setq unread-command-events (list last-input-event)))
		(define-key global-map (kbd "C-c a") 'wy-go-to-char)
	
;; Following on from my post on using C-x k to kill the current buffer, why not bind C-x w to delete-frame in order close the current emacs “window” (remember, in Emacs-speak, a frame is what most other apps would call a window). This is way better than the default C-x 5 0	(Not yet used)
	;(global-set-key (kbd "C-x w") 'delete-frame)

;;; =================================================================================
; it is come from purcell's init-grep
	(setq-default grep-highlight-matches t
				grep-scroll-output t)
	
	(when *is-a-mac*
		(setq-default locate-command "mdfind"))
	
	(when (executable-find "ag")
		(require-package 'ag)
		(require-package 'wgrep-ag)
		(setq-default ag-highlight-search t)
		(global-set-key (kbd "M-?") 'ag-project))

		
; it is come from purcell's init-flycheck. has add in init.el
	; (when (maybe-require-package 'flycheck)
		; (add-hook 'after-init-hook 'global-flycheck-mode)
		; (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

	
; it is come from purcell's init-recentf
	; (recentf-mode 1)
	; (setq-default
		; recentf-max-saved-items 1000
		; recentf-exclude '("/tmp/" "/ssh:"))


		
; it is come from purcell's init-mmm
	; Multiple major modes
	; (require-package 'mmm-mode)
	; (require 'mmm-auto)
	; (setq mmm-global-mode 'buffers-with-submode-classes)
	; (setq mmm-submode-decoration-level 2)

; it is come from purcell's init-






;; -------------------------- customize-operate-habit end --------------------------

(provide 'customize-operate-habit)
