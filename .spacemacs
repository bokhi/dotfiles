;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     markdownhtml
     yaml
     (clojure :variables
              clojure-enable-fancify-symbols t
              clojure-enable-clj-refactor t
              clojure-enable-linters '(clj-kondo joker)
              ;; clojure-enable-sayid t)
              clojure-enable-sayid nil)
     sql
     emacs-lisp
     ;; graphviz
     ;; (sql :variables
     ;;      sql-capitalize-keywords t)
     ;; scheme
     ;; common-lisp
     shell-scripts
     shell
     deft
     imenu-list
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t)
     better-defaults
     ibuffer
     ;; lsp
     git
     github
     version-control
     (org :variables
          org-enable-roam-support t)
     syntax-checking
     (python :variables
             ;; python-sort-imports-on-save t
             ;; python-sort-imports-on-save nil
             python-backend 'lsp
             python-formatter 'black
             ;; python-format-on-save t
             ;; python-format-on-save nil
             ;; python-pipenv-activate t
             ;; python-backend 'anaconda
             python-test-runner 'pytest
             ;; python-auto-set-local-pyvenv-virtualenv 'on-project-switch
             ;; python-auto-set-local-pyenv-version 'on-project-switch
             python-auto-set-local-pyvenv-virtualenv 'on-visit
             python-auto-set-local-pyenv-version 'on-visit
             )
     ipython-notebook
     search-engine
     (shell :variables
            shell-default-shell 'shell)
     copy-as-format
     xclipboard
     ;; multiple-cursors
     ;; (keyboard-layout :variables kl-layout 'colemak-neio)
     ;; slack
     ;; (spell-checking :variables
     ;;                 spell-checking-enable-auto-dictionary t)
     ;; gnus
     dash
     command-log
     ;; semantic
     gtags
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   ;; dotspacemacs-additional-packages '(flycheck-pycheckers traad sicp evil-text-object-python)
   dotspacemacs-additional-packages '(traad beacon
                                            nov
                                            keyfreq
                                            evil-replace-with-register
                                            litable
                                            sicp
                                            evil-text-object-python
                                            eros
                                            chronometer
                                            jupyter
                                            (which-key :location (recipe :fetcher github
                                                                         :repo "justbur/emacs-which-key"))
                                            direnv
                                            ;; (helm-swoop :location (recipe :fetcher github
                                            ;;                               :repo "ashiklom/helm-swoop"))
)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


  (spacemacs|add-toggle variable-pitch
    :mode variable-pitch-mode
    :documentation "variable pitch."
    :evil-leader "tP")

  ;; https://github.com/joaotavora/yasnippet/issues/785#issuecomment-285437447
  (defvar smartparens-mode-original-value)

  ;; https://github.com/syl20bnr/spacemacs/issues/13677#issuecomment-673204519
  (with-eval-after-load 'evil-maps
    (when (featurep 'tab-bar)
      (define-key evil-normal-state-map "gt" nil)
      (define-key evil-normal-state-map "gT" nil)))

  ;; https://gitter.im/syl20bnr/spacemacs?at=5cf2b08dff3f016baa89e15e
  (use-package direnv
    :demand t
    :config
    (direnv-mode)
    (setq direnv-always-show-summary nil)
    :hook
    ((prog-mode) . direnv-update-environment))


  (defun disable-sp-hippie-advice (&rest _)
    (setq smartparens-mode-original-value smartparens-mode)
    (setq smartparens-mode nil)
    t) ; We should still return t.
  ;; This advice could be added to other functions that usually insert
  ;; balanced parens, like `try-expand-list'.
  (advice-add 'yas-hippie-try-expand :after-while #'disable-sp-hippie-advice)

  (defun reenable-sp-hippie-advice (&rest _)
    (when (boundp 'smartparens-mode-original-value)
      (setq smartparens-mode smartparens-mode-original-value)
      (makunbound 'smartparens-mode-original-value)))
  (advice-add 'hippie-expand :after #'reenable-sp-hippie-advice
              ;; Set negative depth to make sure we go after
              ;; `sp-auto-complete-advice'.
              '((depth . -100)))


  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

  (add-hook 'term-mode-hook 'toggle-truncate-lines)
  ;; (with-eval-after-load 'flycheck
  ;;   (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))

  ;; from https://stackoverflow.com/a/29757750
  (defun ediff-copy-both-to-C ()
    (interactive)
    (ediff-copy-diff ediff-current-difference nil 'C nil
                     (concat
                      (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                      (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
  (defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "c" 'ediff-copy-both-to-C))
  (add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)


  ;; ;; https://emacs.stackexchange.com/a/40763
  ;; ;; magit-popup is obsolete, magit now use magit transient
  ;; (with-eval-after-load 'magit-commit
  ;;   (magit-define-popup-option 'magit-rebase-popup
  ;;     ?x "Exec command" "--exec=" #'read-shell-command))

  ;; orgmode babel clojure support


  ;; (require 'ob-ipython)
  (with-eval-after-load 'org
    (setq org-directory "~/Dropbox/notes/"
          org-clock-out-remove-zero-time-clocks t
          org-refile-use-outline-path 'file
          org-outline-path-complete-in-steps nil
          org-agenda-files '("~/Dropbox/notes/")
          org-refile-targets '((org-agenda-files :maxlevel . 9)
                               ("todo.org" :maxlevel . 1))
          org-default-notes-file (concat org-directory "refile.org")
          org-capture-templates
          `(("t" "todo" entry (file org-default-notes-file)
             "* TODO %?\n%U\n%a\n")
            ("m" "meeting" entry (file org-default-notes-file)
             "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
            ("i" "idea" entry (file org-default-notes-file)
             "* %? :IDEA:\n%U\n%a\n")
            ("n" "note" entry (file org-default-notes-file)
             "* %? :NOTE:\n%U\n%a\n")
            ("s" "insights" item (file+headline org-default-notes-file "Insights")
             "%U %?")
            ("e" "efficiency" checkitem (file+headline org-default-notes-file "Efficiency")
             "%U %?")
            ("j" "interruption" checkitem (file+headline org-default-notes-file "Interruptions")
             "[ ] %U %?")
            ("o" "online" table-line (file+headline ,(concat org-directory "metrics.org") "online")
             "|%u| %? |  | |")
            ("h" "habit" entry (file org-default-notes-file)
             "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

  (with-eval-after-load 'git-gutter+
    (defun git-gutter+-remote-default-directory (dir file)
      (let* ((vec (tramp-dissect-file-name file))
             (method (tramp-file-name-method vec))
             (user (tramp-file-name-user vec))
             (domain (tramp-file-name-domain vec))
             (host (tramp-file-name-host vec))
             (port (tramp-file-name-port vec)))
        (tramp-make-tramp-file-name method user domain host port dir)))

    (defun git-gutter+-remote-file-path (dir file)
      (let ((file (tramp-file-name-localname (tramp-dissect-file-name file))))
        (replace-regexp-in-string (concat "\\`" dir) "" file))))

  (setq python-shell-completion-native-enable nil)
  ;; (setq python-shell-extra-pythonpaths (list "/home/martin/ambi/ambi_brain"))
  ;; (setenv "PYTHONPATH" "/home/martin/ambi/ambi_brain")
  (setenv "PIPENV_VENV_IN_PROJECT" "1")
  ;; (setenv "PIPENV_PYTHON" "$PYENV_ROOT/shims/python")
  (add-hook 'python-mode-hook 'pyvenv-mode )

  (add-hook 'python-mode-hook 'evil-text-object-python-add-bindings)

  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'text-mode-hook #'visual-line-mode)



  (setq deft-directory "~/Dropbox/notes")
  (setq paradox-github-token "bdd4e1a50ae0808c5a7ebd56c3ef3b33a3d70b69")
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ditaa . t)
     (python . t)
     (dot . t)
     (shell . t)
     (scheme . t)
     ;; (ipython . t)
     (clojure . t)
     ))

  (setq clojure-toplevel-inside-comment-form t)
  (setq cljr-warn-on-eval nil)
  (spacemacs/declare-prefix "o" "custom")
  (spacemacs/set-leader-keys "oc" 'org-columns)
  (spacemacs/set-leader-keys "od" 'magit-file-dispatch)



  (spacemacs/declare-prefix-for-mode 'python-mode "o" "custom")
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "og" 'dumb-jump-go)

  (spacemacs/set-leader-keys-for-major-mode 'deft-mode "f" 'deft-find-file)



  (defun python-setup-test-buffer ()
    (interactive)
    (delete-other-windows)
    (spacemacs/toggle-current-window-dedication)
    (split-window-right-and-focus)
    (projectile-toggle-between-implementation-and-test)
    (spacemacs/toggle-current-window-dedication)
    (spacemacs/python-test-module nil)
    (winum-select-window-1)
    )
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "ob" 'python-setup-test-buffer)

  (defun orgTZA-open-at-point-ad (oldfun &rest args)
    "Just `org-open-at-point'.
If region is active open all links in region."
    (if (use-region-p)
        (save-excursion
          (save-restriction
            (narrow-to-region (region-beginning) (region-end))
            (goto-char (point-min))
            (while (progn
                     (org-next-link)
                     (null org-link--search-failed))
              (apply oldfun args))))
      (apply oldfun args)))

  (advice-add #'org-open-at-point :around #'orgTZA-open-at-point-ad)

  (defun my-org-inactive-timestamp-header (arg)
    "insert a header on the current line with an inactive timestamp of the current date"
    (interactive "P")
    (beginning-of-line)
    (org-time-stamp-inactive arg)
    (beginning-of-line)
    (org-insert-heading))

  (spacemacs/set-leader-keys-for-major-mode 'org-mode "ot" 'my-org-inactive-timestamp-header)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "on" 'org-next-link)

  (setq evil-replace-with-register-key (kbd "gr"))
  (evil-replace-with-register-install)
  (require 'keyfreq)
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
;;; https://www.emacswiki.org/emacs/UnfillParagraph
;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
  (defun unfill-paragraph (&optional region)
    "Takes a multi-line paragraph and makes it into a single line of text."
    (interactive (progn (barf-if-buffer-read-only) '(t)))
    (let ((fill-column (point-max))
          ;; This would override `fill-column' if it's an integer.
          (emacs-lisp-docstring-fill-column t))
      (fill-paragraph nil region)))

  (define-key global-map "\M-Q" 'unfill-paragraph)
  (setq avy-keys '(?a ?r ?s ?t ?n ?e ?i ?o ))

  (defun evil-scroll-down-other-window ()
    (interactive)
    (scroll-other-window))

  (defun evil-scroll-up-other-window ()
    (interactive)
    (scroll-other-window '-))

  (define-key evil-normal-state-map
    (kbd "C-S-d") 'evil-scroll-down-other-window)

  (define-key evil-normal-state-map
    (kbd "C-S-u") 'evil-scroll-up-other-window)

  (with-eval-after-load 'scroll-all
    (defadvice scroll-all-check-to-scroll (after evil-scroll-all-check-to-scroll activate)
      (cond
       ((memq this-command '(evil-goto-first-line evil-goto-line evil-scroll-page-down evil-scroll-page-up evil-scroll-down evil-scroll-up evil-scroll-line-down evil-scroll-line-up))
        (scroll-all-function-all this-command (prefix-numeric-value current-prefix-arg)))
       ;; ((eq this-command 'evil-goto-first-line)
       ;;  (scroll-all-function-all 'evil-goto-first-line (prefix-numeric-value current-prefix-arg)))
       ;; ((eq this-command 'evil-goto-line)
       ;;  (scroll-all-function-all 'evil-goto-line (prefix-numeric-value current-prefix-arg)))
       ;; ((eq this-command 'evil-scroll-page-down)
       ;;  (scroll-all-function-all 'evil-scroll-page-down (prefix-numeric-value current-prefix-arg)))
       ;; ((eq this-command 'evil-scroll-page-up)
       ;;  (scroll-all-function-all 'evil-scroll-page-up (prefix-numeric-value current-prefix-arg)))

       ;; ((eq this-command 'evil-scroll-up)
       ;;  (scroll-all-function-all 'scroll-down (/ (1- (window-height)) 2)))
       ;; ((eq this-command 'evil-scroll-down)
       ;;  (scroll-all-function-all 'scroll-up (/ (1- (window-height)) 2)))
       ;; ((eq this-command 'evil-scroll-line-down)
       ;;  (scroll-all-function-all 'evil-scroll-line-down (prefix-numeric-value current-prefix-arg)))
       ;; ((eq this-command 'evil-scroll-line-up)
       ;;  (scroll-all-function-all 'evil-scroll-line-up (prefix-numeric-value current-prefix-arg)))
       )))

  ;; (slack-register-team
  ;;  :name "emacs-slack"
  ;;  :default t
  ;;  ;; :client-id "c9c79e82-1554563166.774"
  ;;  :client-id "martinb@ambiclimate.com"
  ;;  ;; :client-secret "mypassword"
  ;;  :client-secret "7iA4Yv0DbR"
  ;;  :token "xoxs-6294989719-473109307078-575293596006-c1c5eaac93d08ac1fe7dbc633b9673ff739ebd28fcd98ec290b88df004fd8595"
  ;;  :subscribed-channels '(general slackbot))

  ;; (with-eval-after-load "ispell"
  ;;   ;; (setq ispell-program-name "hunspell")
  ;;   ;; ispell-set-spellchecker-params has to be called
  ;;   ;; before ispell-hunspell-add-multi-dic will work
  ;;   (ispell-set-spellchecker-params)
  ;;   ;; (ispell-hunspell-add-multi-dic "pl_PL,en_GB")
  ;;   ;; (setq ispell-dictionary "francais,en_GB"))
  ;;   (setq ispell-dictionary "en_GB"))
  (custom-set-faces
   '(company-tooltip-common
     ((t (:inherit company-tooltip :weight bold :underline nil))))
   '(company-tooltip-common-selection
     ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

  ;; (setq evil-move-cursor-back nil
  ;;       evil-move-beyond-eol t)

  )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-abbrev-expand-on-insert-exit nil)
 '(lsp-enable-snippet nil)
 '(magit-diff-refine-hunk 'all)
 '(package-selected-packages
   '(package-lint flycheck-elsa emr clang-format list-utils packed org-roam emacsql-sqlite3 selectric-mode lsp-treemacs cider anaconda-mode iedit magit pythonic bind-key rjsx-mode nodejs-repl livid-mode json-navigator hierarchy js2-refactor js-doc company-tern tern evil-adjust clojure-snippets cider-eval-sexp-fu queue parseedn clojure-mode parseclj a slime-company slime common-lisp-snippets csv-mode dap-mode bui tree-mode gnu-elpa-keyring-update web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode prettier-js impatient-mode helm-css-scss haml-mode emmet-mode counsel-css counsel swiper ivy company-web web-completion-data add-node-modules-path ob-ipython dash-functional ein skewer-mode polymode js2-mode jupyter websocket simple-httpd zmq eros nov esxml stickyfunc-enhance srefactor beacon litable command-log-mode sql-indent keyfreq evil-replace-with-register annoying-arrows-mode evil-text-object-python flycheck-pycheckers yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package unfill treemacs-projectile treemacs-evil traad toc-org symon symbol-overlay string-inflection spaceline-all-the-icons smeargle sicp shell-pop restart-emacs rainbow-delimiters pytest pyenv-mode py-isort popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file nameless mwim multi-term move-text magit-svn magit-gitflow macrostep lorem-ipsum live-py-mode link-hint jinja2-mode insert-shebang indent-guide importmagic ibuffer-projectile hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-gitignore helm-git-grep helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist geiser fuzzy forge font-lock+ flycheck-pos-tip flycheck-package flycheck-bashate flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help engine-mode elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline diminish diff-hl deft define-word cython-mode counsel-projectile copy-as-format company-statistics company-shell company-quickhelp company-ansible company-anaconda column-enforce-mode clean-aindent-mode centered-cursor-mode browse-at-remote blacken auto-yasnippet auto-highlight-symbol auto-compile ansible-doc ansible aggressive-indent ace-link ace-jump-helm-line ac-ispell))
 '(safe-local-variable-values
   '((cider-shadow-default-options)
     (cider-default-cljs-repl)
     (cider-shadow-default-options . ":app")
     (cider-default-cljs-repl . shadow)
     (cider-shadow-cljs-default-options . "app")
     (pytest-global-name . "python -m pytest")
     (geiser-scheme-implementation quote guile)))
 '(send-mail-function 'smtpmail-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
