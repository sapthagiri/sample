# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_stony_session',
  :secret      => '9e8f684ec7c587e16486ef072d198b49a3ca97eb0ca82642a9bed33d9765ed7c033978a20c3e45b8453c72375b244b202a8b67e7ee98d7cc415a278c6b9ea1e1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
