
;; --------------------------------- font-size ---------------------------------
	;; C - Mouse-Scroll-Wheel setting font size.
	;; For Linux
	(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
	(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
	
	;; For Windows
	(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
	(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; 在配置文件比较前面的地方先直接定义中英文字体的列表

(setq-default 
 ;; 默认字体
 english-font '("Source Code Pro" 13 "Courier New" 13 "Source Code Pro" 13)
 chinese-font '("华文细黑" 14 "宋体" 14 "微软雅黑" 14)
 )

;; 在配置文件中添加以下函数

(defun font-exists-p (font)
  "检查字体是否存在"
  (if (null (x-list-fonts font)) nil t))

(defun lgs/set-en-font (font-name font-size)
  "设置英文字体"
  (set-face-attribute 'default nil
                      :font (format "%s:pixelsize=%d" font-name font-size)
                      :weight 'normal))

(defun lgs/set-cn-font (font-name font-size)
  "设置中文字体"
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family font-name :size font-size))))

(defun lgs/set-font-list (font-list set-font-func)
  "设置字体列表，从列表头开始查找存在的字体并设置字体"
  (unless (null font-list)
    (let ((font-name (car font-list))
          (font-size (cadr font-list)))
      (if (font-exists-p font-name)
          (funcall set-font-func font-name font-size)
        (lgs/set-font-list (cddr font-list) set-font-func)))))

(defun lgs/set-monospaced-font (en-fonts cn-fonts)
  "同时设置中英文等宽字体"
  (lgs/set-font-list en-fonts 'lgs/set-en-font)
  (lgs/set-font-list cn-fonts 'lgs/set-cn-font))

;; 在定义函数后调用lgs/set-monosoaced-font来改变字体，调用前检测一下是否有窗口。

(if (window-system) (lgs/set-monospaced-font english-font chinese-font))

; the next line is like purcell's init-fonts.el.
	(defun sanityinc/maybe-adjust-visual-fill-column ()
		"Readjust visual fill column when the global font size is modified.
		This is helpful for writeroom-mode, in particular."
		;; TODO: submit as patch
		(if visual-fill-column-mode
			(add-hook 'after-setting-font-hook 'visual-fill-column--adjust-window nil t)
			(remove-hook 'after-setting-font-hook 'visual-fill-column--adjust-window t)))
	
	(add-hook 'visual-fill-column-mode-hook
			'sanityinc/maybe-adjust-visual-fill-column)



(provide 'customize-fonts)
