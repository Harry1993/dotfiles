PROMPT=$'%{$fg[blue]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info) %{$fg[green]%}[%n@%m]%{$reset_color%}
%{$fg_bold[red]%}>%{$reset_color%} '

PROMPT2="%{$fg_blod[black]%}%_> %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
