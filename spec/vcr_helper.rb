VCR.configure do |configure|
  configure.cassette_library_dir = "spec/fixtures/cassettes"
  configure.hook_into :webmock
  configure.filter_sensitive_data("<TWILIO ACCOUNT SID>") { ENV["TWILIO_ACCOUNT_SID"] }
  configure.filter_sensitive_data("<TWILIO AUTH TOKEN>") { ENV["TWILIO_AUTH_TOKEN"] }
  configure.filter_sensitive_data("<TWIML APPLICATION SID>") { ENV["TWIML_APPLICATION_SID"] }
end
