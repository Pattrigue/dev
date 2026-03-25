# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# User configuration

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Ignore commands that start with spaces and duplicates.

export HISTCONTROL=ignoreboth

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Don't add certain commands to the history file.

export HISTORY_IGNORE="(\&|[bf]g|c|clear|history|exit|q|pwd|* --help)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Use custom `less` colors for `man` pages.

export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# -- Aliases --
if (( $+commands[eza] )); then
  alias ls='eza --icons --git -1'
  alias l='eza -alg --color=always --group-directories-first --git'
  alias ll='eza -aliSgh --color=always --group-directories-first --icons --header --long --git'
  alias lt='eza -@alT --color=always --git'
  alias llt='eza --oneline --tree --icons --git-ignore'
  alias lr='eza -alg --sort=modified --color=always --group-directories-first --git'
fi

if (( $+commands[lazygit] )); then
  alias lg='lazygit'
fi

if (( $+commands[bat] )); then
  alias cat='bat --paging=never --style=plain'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# python uv
if (( $+commands[uv] )); then
  alias py='uv run python'
fi

# pnpm
case "$(uname -s)" in
  Darwin)
    PNPM_HOME="$HOME/Library/pnpm"
    ;;
  Linux)
    PNPM_HOME="$HOME/.local/share/pnpm"
    ;;
esac

if [ -d "$PNPM_HOME" ]; then
  export PNPM_HOME

  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi

# Suggest Arch packages for unknown commands via pkgfile
if [ -r /usr/share/doc/pkgfile/command-not-found.zsh ]; then
  source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# Path to distro-installed fzf integration files
case "$(uname -s)" in
  Darwin)
    if (( $+commands[brew] )); then
      FZF_BASE="$(brew --prefix)/share/fzf"
    fi
    ;;
  Linux)
    FZF_BASE="/usr/share/fzf"
    ;;
esac

[ -d "$FZF_BASE" ] && export FZF_BASE

# Custom command for shutting down fast
poweroff() {
  echo -n "Power off now? [y/N] "
  read -r reply

  case "$reply" in
    [yY]|[yY][eE][sS])
      case "$(uname -s)" in
        Darwin)
          sudo shutdown -h now
          ;;
        Linux)
          if (( $+commands[systemctl] )); then
            systemctl poweroff
          else
            sudo shutdown -h now
          fi
          ;;
        *)
          echo "Unsupported OS: $(uname -s)"
          return 1
          ;;
      esac
      ;;
    *)
      echo "Cancelled."
      ;;
  esac
}
