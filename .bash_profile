
# native .bash_profile that was present in nersc
#begin .profile
if [[ -z $SHIFTER_RUNTIME ]]
then
  # Source appropriate .ext file
  SHELL_PARSING=$0
  if [ $SHELL_PARSING == -su ]
  then
    SHELL_PARSING=`readlink /proc/$$/exe`
  fi

  case $SHELL_PARSING in
    -sh|sh|*/sh)
      if [ -e $HOME/.profile.ext ]; then
        . $HOME/.profile.ext
      fi
      ;;
    -ksh|ksh|*/ksh)
      if [ -e $HOME/.profile.ext ]; then
        . $HOME/.profile.ext
      fi
      ;;
    -bash|bash|*/bash)
      if [ -e $HOME/.bash_profile.ext ]; then
        . $HOME/.bash_profile.ext
      else
        if [ -e $HOME/.profile.ext ]
        then
          . $HOME/.profile.ext
        fi
      fi
      ;;
  esac
fi
#end .profile


for file in ~/.{bash_prompt,exports,aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

