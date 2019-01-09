function __current_path
  echo -n (set_color -o cyan)(pwd | sed "s:^$HOME:~:")(set_color normal) 
end

function fish_prompt
  # Customize fish prompt

  set fish_greeting
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)
  
  set -l pwd (prompt_pwd)

  # set -l cwd $green(pwd | sed "s:^$HOME:~:")

  # Set 'em
  # set_color -b $bg
  # set_color $fg

  # echo -n -s $cwd $normal

  __current_path

  echo -n -s ' » ' $normal
   
end
