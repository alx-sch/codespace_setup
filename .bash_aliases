# Alias definitions

alias vg='valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes --track-fds=yes'
alias vgt='vg --tool=helgrind'
alias vgg='vg --suppressions=./.assets/readline.supp'
