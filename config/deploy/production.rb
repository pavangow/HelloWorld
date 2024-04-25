server '51.20.12.19', user: 'ubuntu', roles: %w{web app db}
set :ssh_options, {
forward_agent: true,
auth_methods: %w[publickey],
keys: %w[/home/blubirch/Downloads/pavanpractice.pem]
}