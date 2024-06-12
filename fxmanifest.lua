fx_version 'cerulean'
game 'redm'

author 'Corex Core'
description 'The Corex Core Framework for RedM'


shared_scripts {
    'config.lua'
}

client_scripts {
    'src/client/common.lua',
    'src/client/main.lua'
}

server_scripts {
    'src/server/common.lua',
    'src/server/main.lua'
}