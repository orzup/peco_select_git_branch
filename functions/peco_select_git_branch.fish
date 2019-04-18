function peco_select_git_branch
  git for-each-ref --format='%(refname:short) | %(committerdate:relative) | %(committername) | %(subject)' --sort=-committerdate refs/heads refs/remotes \
    | column -t -s '|' \
    | grep -v 'origin' \
    | peco \
    | head -n 1 \
    | awk '{print $1}' \
    | read foo

  if [ $foo ]
    commandline (string join ' ' 'git checkout' $foo)
  else
    commandline ''
  end
end
