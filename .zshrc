# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ANDROID_HOME=$HOME/Library/Android/sdk && export PATH=$PATH:$ANDROID_HOME/emulator && export PATH=$PATH:$ANDROID_HOME/platform-tools

# OhMyZSH themes

# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="norm"

ZSH_THEME="oxide"

# neovim config switcher
# alias nvimd="NVIM_APPNAME=nvimd nvim"
# alias nvim-eco="NVIM_APPNAME=nvim-eco nvim"
# alias nvim-kik="NVIM_APPNAME=nvim-kik nvim"
# alias lvim="NVIM_APPNAME=lvim nvim"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# User configuration
# disable underline
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#88c0d0'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
export EDITOR=nvim

# ----- bat (better ls) -----
export BAT_THEME=Nord

# ----- eza -----
export EZA_CONFIG_DIR="$HOME/.config/eza"
alias ls="eza -a --color=always --icons=always -l --git --no-permissions"

# ----- zoxide (better cd) -----
eval "$(zoxide init zsh)"
alias cd="z"

# ----- yazi -----
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# ----- FZF -----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"


export FZF_DEFAULT_OPTS="
  --preview '[[ -d {} ]] && eza --icons=always --tree --color=always {} | head -200 || bat --color=always -n --line-range :500 {}'
  --layout=default --border --style=full
--color=fg:#e5e9f0,bg:#2e3441,hl:#81a1c1
  --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
  --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
  --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% " 

# FIX fzf ALT C on MACOS
bindkey "ç" fzf-cd-widget

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

# f to open full fzf with nvim integration
f() {
  local selection
  selection=$(fd . --hidden --exclude .git --color=always | fzf --ansi) || return

  if [[ -d "$selection" ]]; then
    cd "$selection"
    echo "📁 Changed directory to: $selection"
  else
    nvim "$selection"
  fi
}

# aliases
alias c="clear && printf '\e[3J'"
alias code="open -a Visual\ Studio\ Code.app"
alias create-react="create-react.sh"
alias e="exit"
alias vim="nvim"
