# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias go='tmux-launch'
alias stop='tmux kill-server' 
alias zr='omz reload'

#alias copycubaseprefs='rsync -av /Users/preynol1/Library/Preferences/Cubase\ 12/ /Volumes/MUSIC-MAIN/Settings_Cubase/Preferences_Cubase12_iMac/'
#alias python=/usr/local/bin/python3 #MYEDIT 2023-11-17. Ensures that python refers to the Homebrew installed version. 
#alias unb='ssh preynol1@www2.unb.ca'
#alias webupdate='rsync -av /Users/preynol1/Dropbox/33_WEB/ preynol1@www2.unb.ca:public_html' #2023-11-17 NEEDS UPDATING

alias maple='/Library/Frameworks/Maple.framework/Versions/2022/bin/maple'
alias pdfexpert='/Applications/PDF\ Expert.app/Contents/MacOS/PDF\ Expert'


alias ls='eza --group-directories-first'
#alias ls='lsd'
#alias la='lsd -al'
#alias lt='lsd --tree'

alias c='clear'

alias lg='lazygit'

#fzf
alias ff='fd --type f --no-ignore --hidden . | fzf | sed "s/ /\\\\ /g" | xargs open'
alias fh='fd --type f --exclude Library --no-ignore --hidden . $HOME | fzf | sed "s/ /\\\\ /g" | xargs open'
alias fd='fd --no-ignore'
#alias f='open "$(fzf)"'
#alias ff='open "$(fd --type f --no-ignore . | fzf)"'
#alias fh='fd --type f --no-ignore --hidden . $HOME | fzf | xargs -0  open'
#alias fh='fd --type f --no-ignore --hidden . $HOME | fzf | sed "s/ /\\\\ /g" | xargs open'

#alias rr='ranger'
#alias manranger='open https://ranger.github.io/ranger.1.html'

#vim
alias rs='rm -rf ~/.vim/swap/*'
alias vs='vim -S ~/.vim/session/'
alias vv='vim -S ~/.vim/session/0mainsession.vim'
alias vc='vim -S ~/.vim/session/3computerwikisession.vim'
alias v1='vim -S ~/.vim/session/1teachingwikisession.vim'
alias v2='vim -S ~/.vim/session/2workwikisession.vim'
alias v4='vim -S ~/.vim/session/4musicwikisession.vim'
alias ev='vim ~/.vim/vimrc'
alias 3503='vd /Users/preynol1/1teaching/math3503_online/students_m3503online.csv'
alias mathmajors='vd /Users/preynol1/2work/_SCIENCE-MATH_/advising/_current-students.csv'
