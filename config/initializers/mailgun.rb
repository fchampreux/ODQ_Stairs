  # Mailgun configuration  
    Mailgun.configure do |config|
    config.api_key = 'key-a1da1ee1040a3129f611f99297c814c2'
  end
        
    ActionMailer::Base.mailgun_settings = {
        api_key: 'key-a1da1ee1040a3129f611f99297c814c2',
        domain: 'sandbox7db7792186cb4970b37c778c0b8a3f59.mailgun.org',
      }
