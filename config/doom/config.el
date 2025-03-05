;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 16))

(defun my-weebery-is-always-greater ()
  (let* ((banner '("██╗ ███╗   ███╗ ██╗ ███╗   ██╗ ██████╗  ███╗   ███╗     ███╗     ██████╗  ██████╗ "
                   "██║ ████╗ ████║ ██║ ████╗  ██║ ██╔══██╗ ████╗ ████║    ██║██╗   ███╔═══╝  ███╔══╝ "
                   "██║ ██╔████╔██║ ██║ ██╔██╗ ██║ ██║  ██║ ██╔████╔██║   ██║  ██╗  ███║       ███╗   "
                   "██║ ██║╚██╔╝██║ ██║ ██║╚██╗██║ ██║  ██║ ██║╚██╔╝██║  █████████╗ ███║       ╚███╗  "
                   "██║ ██║ ╚═╝ ██║ ██║ ██║ ╚████║ ██████╔╝ ██║ ╚═╝ ██║ ███║    ███╗ ██████╗  ██████╗ "
		   "╚═╝ ╚═╝     ╚═╝ ╚═╝ ╚═╝  ╚═══╝ ╚═════╝  ╚═╝     ╚═╝ ╚══╝    ╚══╝ ╚═════╝  ╚═════╝ "
		   ))
	 (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
		+doom-dashboard--width
		(concat line (make-string (max 0 (- longest-line (length line))) 32)))
	       "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)

(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "I'm a wizard myself.")))

(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)

(setq +doom-dashboard-menu-sections
      '(("Recent files"
	 :icon (nerd-icons-faicon "nf-fa-file_text" :face 'doom-dashboard-menu-title)
	 :key "SPC c f"
	 :action recentf-open-files)
	("Last session"
	 :icon (nerd-icons-octicon "nf-oct-history" :face 'doom-dashboard-menu-title)
	 :when (cond ((modulep! :ui workspaces)
		      (file-exists-p (expand-file-name persp-auto-save-fname persp-save-dir)))
		     ((require 'desktop nil t)
		      (file-exists-p (desktop-full-file-name))))
	 :key "SPC q l"
	 :action doom/quickload-session)
	("Org-agenda"
	 :icon (nerd-icons-octicon "nf-oct-calendar" :face 'doom-dashboard-menu-title)
	 :when (fboundp 'org-agenda)
	 :key "SPC o a"
	 :action org-agenda)
	("Project"
	 :icon (nerd-icons-octicon "nf-oct-briefcase" :face 'doom-dashboard-menu-title)
	 :key "SPC SPC"
	 :action projectile-switch-project)
	("Configuration"
	 :icon (nerd-icons-octicon "nf-oct-tools" :face 'doom-dashboard-menu-title)
	 :when (file-directory-p doom-user-dir)
	 :key "SPC s SPC"
	 :action doom/open-private-config)
	))
(use-package! doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (setq doom-theme 'doom-tokyo-night)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  (doom-themes-neotree-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(beacon-mode 1)

                                        ; (use-package! holo-layer
                                        ;   :config
                                        ;   (setq holo-layer-enable-cursor-animation t
                                        ;         holo-layer-enable-place-info t
                                        ;         holo-layer-cursor-alpha 100
                                        ;         holo-layer-cursor-animation-interval 25
                                        ;         holo-layer-cursor-animation-type "jelly easing"
                                        ;         holo-layer-python-command "/usr/bin/python3")
                                        ;   (holo-layer-enable))

(after! centaur-tabs
  :ensure t
  :config
  (centaur-tabs-group-by-projectile-project)
  (setq centaur-tabs-style "wave"
        centaur-tabs-set-bar 'under
        centaur-tabs-height 32
        centaur-tabs-set-icons t
        centaur-tabs-icon-type 'nerd-icons)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t))

(use-package! evil-multiedit
  :ensure t
  :config
  (evil-multiedit-default-keybinds)
  (evil-multiedit-mode t))

(use-package! indent-bars
  :ensure t
  :config
  (setq
   indent-bars-color '(highlight :face-bg t :blend 0.5)
   indent-bars-width-frac 0.1
   indent-bars-pad-frac 0.1
   indent-bars-color-by-depth '(:regexp "outline-\\([0-9]+\\)" :blend 1) ; blend=1: blend with BG only
   indent-bars-highlight-current-depth '(:blend 0.5 :width 0.2 :pad 0.1 :pattern "!.!.!." :zigzag 0.1)
   indent-bars-display-on-blank-lines t)
  )
(map! :leader
      :desc "Open the neotree"
      "f" #'neotree)
(map! :leader
      :desc "Recent files"
      "c f" #'recentf-open-files)
(map! :leader
      :desc "Configuration"
      "s SPC" #'doom/open-private-config)
