PROMPT="%(?:%F{106}➜ :%F{167}➜ )"
PROMPT+=' %B%F{109}%c%b%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{72}git:(%F{167}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{72})%b%F{172} 🗿 "
ZSH_THEME_GIT_PROMPT_CLEAN="%F{72})%b "
