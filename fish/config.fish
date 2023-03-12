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
set -U fish_color_command 81a1c1 # valid cmd

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

# Global vars
set -g GOPATH (go env GOPATH)

# Paths
fish_add_path (go env GOPATH)
fish_add_path '/etc/ssl/certs/ca-certificates.crt'

# Tokens and secrets
source ~/.tokens
