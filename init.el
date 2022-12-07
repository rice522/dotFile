;; package 管理
(require 'package)

;; rsync -avz rsync://melpa.org/packages ~/melpa 下载到本地
;; rsync -avz rsync://elpa.gnu.org/elpa/ ~/elpa
(setq package-archives
      '(("melpa-cn" . "~/melpa")
	("gun" . "~/elpa")))

;; 或者使用其他源
;; (setq package-archives
;;       '(("melpa" . "http://elpa.zilongshanren.com/melpa/")
;; 	("gnu" . "http://elpa.zilongshanren.com/gnu/")))

(package-initialize)
(package-install 'ido-vertical-mode)
(package-install 'flx-ido)
(package-install 'magit)
(package-install 'git-gutter)
(package-install 'leerzeichen)

(global-git-gutter+-mode)
;; ido-mode C-x b buffer 列表垂直显示, C-p, C-n 移动
(ido-mode 1)
(ido-everywhere t)
(ido-vertical-mode t)
(setq ido-use-filename-at-point 'guess)
(setq flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq linum-format "%4d \u2502 ")

;; 备份文件~,##等不在当前路径, 统一管理
(setq backup-directory-alist (quote (("." . "~/.emacs-backups"))))

;; 初始两个 eshell
(setq inhibit-startup-message t)
(eshell)
(split-window-horizontally)
(rename-buffer "run")
(eshell)

;; 全局补全
;; (global-auto-complete-mode)

;; 快捷键
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "C-c ;") 'linum-mode)
(global-set-key (kbd "C-c C-;") 'linum-mode)
(global-set-key (kbd "C-c e") 'eshell)
(global-set-key (kbd "C-c l") 'goto-line)
(global-set-key (kbd "C-c r") (lambda() (interactive) (switch-to-buffer "run")))
(global-set-key (kbd "C-c s") 'sort-lines)
(global-set-key (kbd "C-c t") 'ff-get-other-file)
(global-set-key (kbd "C-c v") 'eval-region)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-n") 'scroll-up)
(global-set-key (kbd "M-p") 'scroll-down)
(global-set-key (kbd "C-c C-SPC") 'leerzeichen-mode)
