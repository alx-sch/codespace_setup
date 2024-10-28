# Alias definitions

alias vg='valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes --track-fds=yes'
alias vgt='valgrind --tool=helgrind'
alias vgg='vg --suppressions=./.assets/readline.supp'

# Add author info

git config --global user.email "alexander.o.schenk@gmail.com"
git config --global user.name "alx-sch"
