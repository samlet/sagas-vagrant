#!/bin/bash
# this file will be included in ~/.bashrc

# alias using='conda activate '
alias using='source activate '
alias env-list='conda info --envs'

alias sz='python -m sagas.tool.misc trans_clip zh '\''en;fr;ja'\'' ja False'
alias sfa="python -m sagas.tool.misc trans_clip fa 'en;zh-CN;ja' ja False"
alias sj="python -m sagas.tool.misc trans_clip ja 'en;zh-CN;fr' ja False"
alias st="python -m sagas.tool.misc trans_clip tr 'en;zh-CN;ja' ja False"
alias se="python -m sagas.tool.misc trans_clip en 'fr;zh-CN;ja' ja False"
alias sp="python -m sagas.tool.misc trans_clip pt 'en;es;ja' ja False"
alias spt="python -m sagas.tool.misc trans_clip pt 'en;zh;ja' ja False"
alias si="python -m sagas.tool.misc trans_clip it 'en;pt;ja' ja False"
alias sit="python -m sagas.tool.misc trans_clip it 'en;zh;ja' ja False"

alias backend="cd compose/dist && docker-compose up"

alias s1='honcho start -f Procfile_linux'
alias s2='honcho start -f Procfile_rasa'

alias runc='docker-compose run'
alias runi='docker-compose exec'
alias run='docker-compose up'
