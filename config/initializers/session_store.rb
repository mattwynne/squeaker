# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_squeaker_session',
  :secret      => 'c4326816e795712a020c9bec1623c6a2fb5c9264f35f69d42a7add58ff67fe4d02ccc7837d422e6ee73dbbdb3ed9bb6df0096cc63ffb89973cdb42383280fa73'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
