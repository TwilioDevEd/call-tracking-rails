VCR.configure do |configure|
  configure.cassette_library_dir = "spec/fixtures/cassettes"
  configure.hook_into :webmock
  configure.filter_sensitive_data("<TWILIO ACCOUNT SID>") { ENV.fetch("TWILIO_ACCOUNT_SID") }
  configure.filter_sensitive_data("<TWILIO AUTH TOKEN>") { ENV.fetch("TWILIO_AUTH_TOKEN") }
  configure.filter_sensitive_data("<TWIML APPLICATION SID>") { ENV.fetch("TWIML_APPLICATION_SID") }
end
