# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_squeaker_session',
  :secret      => '4f05d983ab68f9af8c88df43927e7341dc25a53b49967d9f650630d26be831989c9b83db79c743b17a210e28d676ce8d99f53bdc0d9c35672e501b20f2dafd98'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
