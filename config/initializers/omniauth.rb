
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
    '991484129174-78tjr2u3ap9gpio4aqf1fcotgc5nkqv7.apps.googleusercontent.com',
    'IlV6DY3zVmhIfkLTeUtXKTJU',
    {name: "google_login", approval_prompt: ''}
end