# Suppress greeting
set fish_greeting

# Vim key bindings
function fish_user_key_bindings
  fish_vi_key_bindings
end

# Git workflow
function gita
  git pull
  git worktree add $argv[1] $argv[2]
  cd $argv[1]
  tmux new -s $argv[1]
end

function gitb
  git pull
  git worktree add $argv[1] -b $argv[2]
  cd $argv[1]
  tmux new -s $argv[1]
end

function gitrm
  rm -rf $argv[1]
  git worktree prune
end

# Color scheme
set -U fish_color_operator d8dee9
set -U fish_color_escape d8dee9
set -U fish_color_autosuggestion d8dee9 # autocomplete
set -U fish_color_comment ebcb8b
set -U fish_color_param d8dee9
set -U fish_color_error bf616a # invalid cmd
set -U fish_color_end 3f37b3
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

# Paths
fish_add_path (go env GOPATH)'/bin'
fish_add_path (go env GOPATH)'/pkg'
fish_add_path '/etc/ssl/certs/ca-certificates.crt'

# Tokens and secrets
source ~/.tokens
