# ZSH aliases 
# check to see if the binary 'eza' exists before running the aliases
# this should be valid in ZSH. 

if [ -x "$(command -v eza)" ]; then
    # general use
    alias ls='eza --group-directories-first'                                                          # ls
    alias l='eza -lbF --git --group-directories-first'                                                # list, size, type, git
    alias ll='eza -lbhGF --git --group-directories-first'                                             # long list
    alias llm='eza -lbhGd --git --sort=modified'                            # long list, modified date sort
    alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale --group-directories-first'  # all list
    alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --group-directories-first' # all + extended list

    # specialty views
    alias lS='eza -1 --group-directories-first'                                                              # one column, just names
    alias lt='eza --tree --level=2 --group-directories-first'                                         # tree
fi
