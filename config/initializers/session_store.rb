# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_scarab_session',
  :secret      => '542fd33b5c83f95277828a1967c093c2266871c67741025df1a3a339e356a0f2eeee15680647d2fdf0325bdc87e29fcf1be29e434db9012695fb7a68b61aba92'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
