# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

begin
  CodeMontage::Application.config.secret_token =
  if !Rails.env.production?
    ('x' * 30) # meets minimum requirement of 30 chars long
  elsif ENV['SECRET_TOKEN']
    ENV['SECRET_TOKEN'] # set secret_token from ENV
  else
    token_file = Rails.root.to_s + '/secret_token'
    to_load = open(token_file).read
    to_load # set secret_token from file
  end
rescue LoadError, Errno::ENOENT => e
  raise "Secret token couldn't be loaded! Error: #{e}"
end
