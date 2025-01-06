#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history
bindkey -v

bindkey  "^[[1~" beginning-of-line
bindkey  "^[[4~" end-of-line
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[2~" overwrite-mode
bindkey "^[[3~" delete-char
bindkey "^[[5~" beginning-of-buffer-or-history
bindkey "^[[6~" end-of-buffer-or-history
bindkey '^sp' history-beginning-search-backward
bindkey '^sn' history-beginning-search-forward

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
if [ -e "$HOME/.config/zsh/cdpaths.zsh" ]; then
  plug "$HOME/.config/zsh/cdpaths.zsh"
fi

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "PicoGeyer/zsh-picocharge"
plug "zap-zsh/vim"
plug "PicoGeyer/zsh-pico-prompt"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"

# keybinds
bindkey '^ ' autosuggest-accept

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\"" 
  alias catt="bat --theme \"Visual Studio Dark+\"" 
fi

eval "$(direnv hook zsh)"
