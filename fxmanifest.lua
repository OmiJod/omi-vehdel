fx_version 'cerulean'
game 'gta5'

author 'Nullvalue'
version '1.1.3'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client.lua'
} 

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
} 

lua54 'yes'