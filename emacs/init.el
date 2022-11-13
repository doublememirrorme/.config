(setq inhibit-startup-message t)
(setq frame-resize-pixelwise t)
(scroll-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 9)
(column-number-mode)
(global-display-line-numbers-mode t)
(global-auto-revert-mode t)
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(defvar cindy/default-font-size 180)
(set-face-attribute 'default nil :font "Fira Code" :height cindy/default-font-size)
(set-face-attribute 'fixed-pitch nil :font "Fira Code" :height cindy/default-font-size)
(set-face-attribute 'variable-pitch nil :font "SF Pro Text" :height cindy/default-font-size :weight 'regular)

;; (defhydra hydra-text-scale (:timeout 4)
;;   "scale text"
;;   ("j" text-scale-increase "in")
;;   ("k" text-scale-decrease "out")
;;   ("f" nil "finished" :exit t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Needs to be run first time 
(use-package emojify
  :hook (after-init . global-emojify-mode))

(setq custom-theme-directory "~/.config/emacs/themes/")

(defun cindy/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'tinacious-design-light t))
    ('dark (load-theme 'deeper-blue t))))

(add-hook 'ns-system-appearance-change-functions #'cindy/apply-theme)

(use-package all-the-icons)

;; (use-package swiper)

;; (use-package counsel
;;   :bind (("M-x" . counsel-M-x)
;;          ("C-x b" . counsel-ibuffer)
;;          ("C-x C-f" . counsel-find-file)
;;          :map minibuffer-local-map
;;          ("C-r" . 'counsel-minibuffer-history)))

;; (use-package ivy
;;   :diminish
;;   :bind (("C-f" . swiper)
;;          :map ivy-minibuffer-map
;;          ("TAB" . ivy-alt-done)
;;          ("C-l" . ivy-alt-done)
;;          ("C-j" . ivy-next-line)
;;          ("C-k" . ivy-previous-line)
;;          :map ivy-switch-buffer-map
;;          ("C-k" . ivy-previous-line)
;;          ("C-l" . ivy-done)
;;          ("C-d" . ivy-switch-buffer-kill)
;;          :map ivy-reverse-i-search-map
;;          ("C-k" . ivy-previous-line)
;;          ("C-d" . ivy-reverse-i-search-kill))
;;   :config
;;   (ivy-mode 1))

;; (use-package ivy-rich
;;   :init
;;   (ivy-rich-mode 1))

;; This is recomended
;; (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)

;; (use-package which-key
;;   :init (which-key-mode)
;;   :diminish which-key-mode
;;   :config
;;   (setq which-key-idle-delay 0))

;; (use-package helpful
;;   :custom
;;   (counsel-describe-function-function #'helpful-callable)
;;   (counsel-describe-variable-function #'helpful-variable)
;;   :bind
;;   ([remap describe-function] . counsel-describe-function)
;;   ([remap describe-command] . helpful-command)
;;   ([remap describe-variable] . counsel-describe-variable)
;;   ([remap describe-key] . helpful-key))

;; (use-package general
;;   :config
;;   (general-create-definer cindy/leader-keys
;;     :keymaps '(normal insert visual emacs)
;;     :prefix "SPC"
;;     :global-prefix "C-SPC")

;; (cindy/leader-keys
;;     "s"  '(:ignore t :which-key "styles")
;;     "sl" '(counsel-load-theme :which-key "load theme")))

;; (cindy/leader-keys
;;   "ss" '(hydra-text-scale/body :which-key "scale text"))

;; (use-package hydra)

;; (use-package projectile
;;   :diminish projectile-mode
;;   :config (projectile-mode)
;;   :custom ((projectile-completion-system 'ivy))
;;   :bind-keymap
;;   ("C-c p" . projectile-command-map)
;;   :init
;;   (when (file-directory-p "~/Projects/")
;;     (setq projectile-project-search-path '("~/Projects")))
;;   (setq projectile-switch-project-action #'projectile-dired))

;; (use-package counsel-projectile
;;   :config (counsel-projectile-mode))

;; (use-package magit
;;   :custom
;;   (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; (use-package org
;;   :hook (org-mode . cindy/org-mode-setup)
;;   :config
;;   (setq org-ellipsis " :point_down_tone4:"
;; 	org-hide-emphasis-markers t))

;; (defun cindy/org-mode-setup ()
;;   (org-indent-mode)
;;   (variable-pitch-mode 1)
;;   (visual-line-mode 1))

;; (defun cindy/org-babel-tangle-config ()
;;   (when (string-equal (buffer-file-name)
;;                       (expand-file-name "./Init.org"))
;;     (let ((org-confirm-babel-evaluate nil))
;;       (org-babel-tangle))))

;; (add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'cindy/org-babel-tangle-config)))

;; (require 'org-tempo)

;; (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
;; (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))

;; (use-package org-bullets
;;   :after org
;;   :hook (org-mode . org-bullets-mode)
;;   :custom
;;   (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; ;; Set faces for heading levels
;; (dolist (face '((org-level-1 . 1.6)
;; 		(org-level-2 . 1.1)
;; 		(org-level-3 . 1.05)
;; 		(org-level-4 . 1.0)
;; 		(org-level-5 . 1.1)
;; 		(org-level-6 . 1.1)
;; 		(org-level-7 . 1.1)
;; 		(org-level-8 . 1.1)))
;; 	(set-face-attribute (car face) nil :font "SF Pro Text" :weight 'bold :height (cdr face)))

;; ;; Ensure that anything that should be fixed-pitch in Org files appears that way
;; (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
;; (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
;; (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
;; (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
;; (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
;; (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
;; (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

;; ;; Center text
;; (defun cindy/org-mode-visual-fill ()
;;   (setq visual-fill-column-width 80
;;         visual-fill-column-center-text t)
;;   (visual-fill-column-mode 1))

;; (use-package visual-fill-column
;;   :hook (org-mode . cindy/org-mode-visual-fill))

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

;; Use visual line motions even outside of visual-line-mode buffers
(evil-global-set-key 'motion "j" 'evil-next-visual-line)
(evil-global-set-key 'motion "k" 'evil-previous-visual-line)

(evil-set-initial-state 'messages-buffer-mode 'normal)
(evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; (require 'undo-tree)
;; (global-undo-tree-mode)
;; (evil-set-undo-system 'undo-tree)

;; (defun cindy/lsp-mode-setup ()
;;    (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
;;    (lsp-headerline-breadcrumb-mode))

;; (use-package lsp-mode
;;   :commands (lsp lsp-deferred)
;;   :hook (lsp-mode . cindy/lsp-mode-setup)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :config
;;   (lsp-enable-which-key-integration t))

;; (use-package typescript-mode
;;   :mode "\\.ts\\'"
;;   :hook (typescript-mode . lsp-deferred)
;;   :config
;;   (setq typescript-indent-level 2))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(all-the-icons use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
