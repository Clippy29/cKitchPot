fx_version 'adamant'
games { 'gta5' };

shared_scripts {
	"shared/*.lua",
}

client_scripts {
	'client/*.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'server/*.lua',
}