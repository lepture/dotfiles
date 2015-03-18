function fish_prompt --description 'Write out the prompt'
  set -l last_status $status
  set -l branch (git rev-parse --abbrev-ref HEAD ^/dev/null)

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  if test $branch
    echo -n '|'
    set_color yellow
    echo -n $branch
    set_color normal
  end

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  set_color normal

  echo -n '$ '
end
