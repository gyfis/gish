function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function fish_right_prompt
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l magenta (set_color -o magenta)
  set -l normal (set_color normal)

  set -l git_branch (_git_branch_name)

  if [ $git_branch ]
    set git_info "$normal$magenta$git_branch$normal "

    if not git diff --quiet --ignore-submodules HEAD --
      set -l dirty "$yellow *"
      set git_info "$dirty$git_info"
    end
  end

  echo -n $git_info
  echo -n -s $normal (date +" %a %d %b  %H:%M:%S ")
end
