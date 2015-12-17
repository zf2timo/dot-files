# Colors in Bash
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

#list and color ls result
alias ls='ls -l --color=auto'

# Start a debug session on a console
alias php-debug='export PHP_IDE_CONFIG=serverName=timo.hwxdev; php -dxdebug.remote_autostart=1 -dxdebug.remote_host=192.168.2.195'

# List all mails
alias mail='mail -f'

# up & down map to history search once a command has been started.
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
