# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [
  #passw essentially hides anything that starts with "passw"
  #this does not hid it in the data base, just the terminal
  :passw, # TODO: comment back in to hide params beginning with "passw"
  :secret,
  :token,
  :_key,
  :crypt,
  :salt,
  :certificate,
  :otp,
  :ssn
]
