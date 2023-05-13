# ZSH aliases 
# check to see if the binary 'exa' exists before running the aliases
# this should be valid in ZSH. 

if [ -x "$(command -v exa)" ]; then
    # general use
    alias ls='exa --group-directories-first'                                                          # ls
    alias l='exa -lbF --git --group-directories-first'                                                # list, size, type, git
    alias ll='exa -lbGF --git --group-directories-first'                                             # long list
    alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
    alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale --group-directories-first'  # all list
    alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --group-directories-first' # all + extended list

    # specialty views
    alias lS='exa -1 --group-directories-first'                                                              # one column, just names
    alias lt='exa --tree --level=2 --group-directories-first'                                         # tree
fi