# ZSH aliases 
# check to see if the binary 'eza' exists before running the aliases
# this should be valid in ZSH. 

if [ -x "$(command -v eza)" ]; then
    # general use
    alias ls='eza --group-directories-first'                                                          # ls
    alias l='eza -lbF --git --icons --group-directories-first'                                                # list, size, type, git
    alias ll='eza -lbhGF --git --icons --group-directories-first'                                             # long list
    alias llm='eza -lbhGd --git --icons --sort=modified'                            # long list, modified date sort
    alias la='eza -lbhHigUmuSa --icons --time-style=long-iso --git --color-scale --group-directories-first'  # all list
    alias lx='eza -lbhHigUmuSa@ --icons --time-style=long-iso --git --color-scale --group-directories-first' # all + extended list

    alias xl='exa -la --icons --color=always'

    # specialty views
    alias lS='eza -1 --icons --group-directories-first'                                                              # one column, just names
    alias lt='eza --tree --icons --level=2 --group-directories-first'                                         # tree
fi
