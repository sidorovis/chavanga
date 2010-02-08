# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_chavanga_session',
  :secret      => '725a4934b28cd15f906dfc45b6e68ad54d273fad05740e0c2e8301766aac08216f6f5db03b7e304fce65874b8b91f358f71cb4f4e253b47d1c785b3559a6e291'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
