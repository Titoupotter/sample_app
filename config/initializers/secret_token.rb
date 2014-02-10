# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
    token_file = Rails.root.join('.secret')
    if File.exist?(token_file)
     #Use existing token
     File.read(token_file).chomp
    else
     #generate a new token and store it in token_file.
     token= SecureRandom.hex(64)
     File.write(token_file, token)
     token
    end
end

SampleApp::Application.config.secret_key_base = '6529af1a6ddfaf45355f476f338740946807dc51e01f89fb1e9d9901cee5e167d36d641fa07a9b2effc341fcee592b820116c146612471b8987bcc782b724add'
