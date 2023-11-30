# Suppress greeting
set fish_greeting

# Vim key bindings
function fish_user_key_bindings
  fish_vi_key_bindings
end

# User confirmation
function read_confirm
  while true
    read -l -P 'Do you want to continue? [y/N] ' confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end

# Git workflow
function jj-new
	git stash
	git checkout main
	git pull
	git stash pop
	git checkout -b $argv[1]
	git add --all
	git commit -m $argv[1]
	gh pr create --draft --title $argv[1]
end

function jj-push
	git reset main --soft
	git add --all
	git commit -m "$(_git_branch)"
	git push -f
end

function jj-sync
	git fetch origin main:main
	git rebase origin/main
	git push -f
end

# Color scheme
set -U fish_color_operator d8dee9
set -U fish_color_escape d8dee9
set -U fish_color_autosuggestion d8dee9 # autocomplete
set -U fish_color_comment ebcb8b
set -U fish_color_param d8dee9
set -U fish_color_error bf616a # invalid cmd
set -U fish_color_end 88c0d0
set -U fish_color_redirection b48ead
set -U fish_color_quote ebcb8b
set -U fish_color_command 88c0d0 # valid cmd

#Cursor modes
set -U fish_cursor_default 'block'
set -U fish_cursor_insert 'line'
set -U fish_cursor_visual 'block'

# Export fn
function export
  if [ $argv ] 
    set var (echo $argv | cut -f1 -d=)
    set val (echo $argv | cut -f2 -d=)
    set -g -x $var $val
  else
    echo 'export var=value'
  end
end

# prompt design
function _git_branch
  echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end

function fish_prompt
  set -l white (set_color -o d8dee9)
  set -l blue (set_color -o 81a1c1)

  echo -n -s $white [$blue(basename (prompt_pwd))$white]-[$blue(_git_branch)$white] ' '
end

# Global vars
set -g GOPATH (go env GOPATH)
set -g PYTHON3_HOST_PROG /usr/bin/python3

# Default text editor
set -Ux EDITOR nvim
set -Ux VISUAL nvim

# Paths
fish_add_path (go env GOPATH)'/bin'
fish_add_path (go env GOPATH)'/pkg'
fish_add_path '/etc/ssl/certs/ca-certificates.crt'
fish_add_path $HOME'/.local/bin'

# Tokens and secrets
source ~/.tokens

# Haskell path
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/javimaellas/.ghcup/bin # ghcup-env
