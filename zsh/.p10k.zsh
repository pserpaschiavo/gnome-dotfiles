# Powerlevel10k Configuration - Gruvbox Material Dark Theme
# Generated with custom Gruvbox Material colors
# Based on rainbow style, customized for Gruvbox Material Dark Hard

# Temporarily change options.
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Unset all configuration options.
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # Zsh >= 5.1 is required.
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  # ═══════════════════════════════════════════════════════════════════════════
  # Gruvbox Material Dark Hard - Color Palette
  # ═══════════════════════════════════════════════════════════════════════════
  # Background colors (dark to light)
  local bg0_hard='234'      # #1d2021
  local bg0='235'           # #282828
  local bg1='237'           # #32302f
  local bg2='239'           # #45403d
  local bg3='241'           # #5a524c
  
  # Foreground colors
  local fg0='229'           # #fbf1c7
  local fg1='223'           # #ebdbb2
  local fg2='250'           # #d5c4a1
  local fg3='248'           # #bdae93
  local fg4='246'           # #a89984
  
  # Color palette
  local red='167'           # #fb4934
  local green='142'         # #b8bb26
  local yellow='214'        # #fabd2f
  local blue='109'          # #83a598
  local purple='175'        # #d3869b
  local aqua='108'          # #8ec07c
  local orange='208'        # #fe8019
  local gray='245'          # #928374

  # ═══════════════════════════════════════════════════════════════════════════
  # Prompt Style
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_MODE=nerdfont-v3
  typeset -g POWERLEVEL9K_ICON_PADDING=moderate
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=true
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  
  # Multiline prompt
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX='%238F─╮'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX='%238F─┤'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX='%238F─╯ '
  
  # Transient prompt
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  # ═══════════════════════════════════════════════════════════════════════════
  # Left Prompt Segments
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon
    dir
    vcs
    newline
    prompt_char
  )

  # ═══════════════════════════════════════════════════════════════════════════
  # Right Prompt Segments
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    background_jobs
    direnv
    virtualenv
    anaconda
    pyenv
    goenv
    nodenv
    nvm
    nodeenv
    rbenv
    rvm
    kubecontext
    context
    time
  )

  # ═══════════════════════════════════════════════════════════════════════════
  # OS Icon
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=$fg0
  typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=$blue

  # ═══════════════════════════════════════════════════════════════════════════
  # Prompt Character
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$green
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$red
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true

  # ═══════════════════════════════════════════════════════════════════════════
  # Directory
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=$blue
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=$bg0_hard
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=$bg1
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=$fg0
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  
  typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
  
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3
  typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND=$red
  
  typeset -g POWERLEVEL9K_DIR_CLASSES=()

  # ═══════════════════════════════════════════════════════════════════════════
  # VCS (Git)
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$bg0_hard
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$green
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$bg0_hard
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$orange
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$bg0_hard
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$yellow
  
  typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1
  typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'
  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=false
  typeset -g POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash git-remotebranch git-tagname)
  
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

  # ═══════════════════════════════════════════════════════════════════════════
  # Status
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=$green
  typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND=$bg1
  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✓'
  
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=$red
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=$bg1
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✗'

  # ═══════════════════════════════════════════════════════════════════════════
  # Command Execution Time
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=$fg0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=$bg1
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'

  # ═══════════════════════════════════════════════════════════════════════════
  # Background Jobs
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=$fg0
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=$bg1

  # ═══════════════════════════════════════════════════════════════════════════
  # Time
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=$fg0
  typeset -g POWERLEVEL9K_TIME_BACKGROUND=$bg1
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'

  # ═══════════════════════════════════════════════════════════════════════════
  # Python Virtual Environment
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=$bg0_hard
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=$yellow
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
  typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

  # ═══════════════════════════════════════════════════════════════════════════
  # Node.js Version
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_NVM_FOREGROUND=$bg0_hard
  typeset -g POWERLEVEL9K_NVM_BACKGROUND=$green

  # ═══════════════════════════════════════════════════════════════════════════
  # Kubernetes Context
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile|flux|fluxctl|stern'
  typeset -g POWERLEVEL9K_KUBECONTEXT_FOREGROUND=$bg0_hard
  typeset -g POWERLEVEL9K_KUBECONTEXT_BACKGROUND=$aqua

  # ═══════════════════════════════════════════════════════════════════════════
  # Context (user@host)
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=$fg0
  typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=$bg1
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_CONTENT_EXPANSION=
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=$red
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=$bg1

  # ═══════════════════════════════════════════════════════════════════════════
  # Direnv
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=$bg0_hard
  typeset -g POWERLEVEL9K_DIRENV_BACKGROUND=$orange

  # ═══════════════════════════════════════════════════════════════════════════
  # Instant Prompt
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  # ═══════════════════════════════════════════════════════════════════════════
  # Transient Prompt
  # ═══════════════════════════════════════════════════════════════════════════
  
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always

}

# Restore options
(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
