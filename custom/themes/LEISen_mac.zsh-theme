##### My theme #####

function macLogo {
  echo -n ""
}


# ☠️

# VCS
YS_VCS_PROMPT_PREFIX1="%{$fg[white]%}on%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2="%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%} x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%} o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git:${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY "
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN "
# vcs_branch_glyph=$(print -P $'\Ue0a0') # 


# HG info
local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${YS_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$YS_VCS_PROMPT_DIRTY"
		else
			echo -n "$YS_VCS_PROMPT_CLEAN"
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}

local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"

# Prompt format:
#
# ╭─ℹ︎ PRIVILEGES USER @ MACHINE in DIRECTORY
# ⇣   git:BRANCH STATE  o ♨︎ [TIME] C:LAST_EXIT_CODE
# ╰─⎈ COMMAND
#
# For example:
#
# ╭─ℹ︎ LEISen @ LEIs-MacBook-Pro in ~/.oh-my-zsh/custom
# ⇣   on git:master  o ♨︎ [12:31:31]
# ╰─⎈ 


local time_dis="%{$fg[white]%}♨︎ [%*]"


## ╭─# ⌾ ℹ︎ ⏚ ☮︎ ☯︎ ⚉ ⚇ ♅ ♇ ♁ ☄︎ ☿ ☉ ♎︎ ♍︎ ♋︎ ♉︎ ♌︎ ☀︎ 
local LS_info_symbol="%{$terminfo[bold]$fg[blue]%}╭─$(macLogo)%{$reset_color%}"

## ╰─$ ⌘ ⌾ ⚛︎ ♕ ♥︎ ✪ ⍟ 🀀 🀂 🀁 🀃 🀊 🀏 ☠︎ ☢︎ ☣︎ ♲ ♻︎ ⚡︎ ⚓︎ ✈︎ ♨︎ ♎︎ ❖ ✡︎ ❄︎ ⚙︎ ⎈ ⌚︎ ☕︎ ℞ ∞ ⨴ ⨵ ⨳ ⨭ ⨮ ⩷ ⩸ ⦓ ⦔ ⦕ ⦖ 𝓛 𝓢 𝓓 𝓟 𝜆 𝚲 
local LS_run_symbol="%(!.%{$terminfo[bold]$fg[red]%}╰─☠️%{$reset_color%}.%{$terminfo[bold]$fg[red]%}╰─℞%{$reset_color%})"

local LS_info="%{$reset_color%}\
%(!,%{$fg[red]%}%n%{$reset_color%},%{$fg[cyan]%}%n) \
%{$reset_color%}\
%{$fg[white]%}@ \
%{$fg[green]%}%m \
%{$fg[white]%}\uF115 \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${hg_info}\

⇣   ${git_info}\
\
"

local LS_info_root="%{$reset_color%}\
%{$fg[red]%}%n%{$reset_color%} \
%{$reset_color%}\
%{$fg[white]%}@ \
%{$fg[green]%}%m \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${hg_info}\

⇣   ${git_info}\
\
"


PROMPT="
$LS_info_symbol "
PROMPT+="$LS_info"
PROMPT+="$time_dis $exit_code"
PROMPT+="
$LS_run_symbol "


