
# shortcuts
alias xm='python ~/Dropbox/toolkit/iScript/xiami.py'
alias fuck="thefuck"
alias chr='chromium-browser&'
alias def='~/bin/translate-shell/translate :zh-TW'
alias matlab="/usr/local/MATLAB/R2017a/bin/matlab -nosplash -nodisplay"

# mimic commands on macOS
alias open="xdg-open > /dev/null 2>&1"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# list file with full information sorted by time
alias ll="ls -lhtr"

# print file bi-sidedly
alias lp="lp -o sides=two-sided-long-edge"

# convert ps to pdf in standalone
alias ps2pdf='ps2pdf -dEPSCrop'

# use trash instead of rm for unintended deletion
alias rm='gio trash'

# Google Calendar (gcalcli)
alias calc="gcalcli --configFolder ~/.gcalcli_catmail calw"
alias calg="gcalcli --configFolder ~/.gcalcli_gmail calw"

# what is my ip address
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
