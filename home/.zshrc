# ============================================================
#                    ZSHRC - g3narin
#        Clean • Stable • OSCP-friendly • Git visible
# ============================================================

# ----------------------------
# Opciones base
# ----------------------------
setopt PROMPT_SUBST
setopt NO_BEEP
export ZSH_DISABLE_COMPFIX=true

# ----------------------------
# Oh My Zsh
# ----------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""   # usamos prompt custom
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source "$ZSH/oh-my-zsh.sh"

# ----------------------------
# Colores ZSH
# ----------------------------
autoload -Uz colors && colors

# ----------------------------
# Git branch (vcs_info) - FIX OMZ
# ----------------------------
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats       '%F{220}-[%F{220} %b%F{220}]%f'
zstyle ':vcs_info:git:*' actionformats '%F{220}-[%F{220} %b%F{202}*%F{220}]%f'

add-zsh-hook precmd vcs_info

# ----------------------------
# Prompt personalizado
# ----------------------------
PS1='%{$fg[blue]%}%B[%b%{$fg[cyan]%}%n%{$fg[grey]%}%B %F{cyan}✘%f %b%{$fg[cyan]%}%m%{$fg[blue]%}%B]-%b%{$fg[blue]%}%B[%b%{$fg[white]%}%~%{$fg[blue]%}%B]%b${vcs_info_msg_0_}
%{$fg[cyan]%}%B>>>%b%{$reset_color%} '

# ----------------------------
# LS_COLORS (tema limpio)
# ----------------------------
LS_COLORS="di=38;2;129;161;193:fi=38;2;216;222;233:ex=38;2;163;190;140:ln=38;2;208;135;112:so=38;2;235;203;139:pi=38;2;180;142;173:bd=38;2;191;97;106:cd=38;2;143;188;187:or=38;2;255;85;85:mi=38;2;255;0;0"
export LS_COLORS

# ----------------------------
# Alias útiles
# ----------------------------
alias cat="batcat --theme='Solarized (dark)'"
alias ls='eza --icons=always --color=always'
alias ll='eza --icons=always --color=always -la'
alias la='eza --icons=always --color=always -a'

# ----------------------------
# ZSH Syntax Highlighting styles
# ----------------------------
ZSH_HIGHLIGHT_STYLES[command]='fg=81'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=82'
ZSH_HIGHLIGHT_STYLES[function]='fg=220'
ZSH_HIGHLIGHT_STYLES[alias]='fg=213'
ZSH_HIGHLIGHT_STYLES[external]='fg=208'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=199'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=196'

# ----------------------------
# PATH extra
# ----------------------------
export PATH="$HOME/.bin:$PATH"
