fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Corex Core'
description 'The Corex Core Framework for RedM'


shared_scripts {
    'config.lua',
}

client_scripts {
    'src/client/common.lua',
    'src/client/functions.lua',
    'src/client/main.lua',
    'src/shared/modules/*.lua'
}

server_scripts {
    'src/server/common.lua',
    'src/server/functions.lua',
    'src/server/main.lua',
    'src/shared/modules/*.lua'
}