fx_version 'cerulean'

games { 'gta5' }

author 'ZOBYETEAM (TAK)'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/lib.lua',

    'functions/exports.lua',
    'functions/**/client.lua'
}

server_scripts {
    'server/main.lua',
    'server/lib.lua',

    'functions/exports.lua',
    'functions/**/server.lua'
}