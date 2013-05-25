
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
    ENV['991484129174.apps.googleusercontent.com'],
    ENV['FLUEKuNwficOrOEpoD28-VcB'],
    {name: "google_login", approval_prompt: ''}
end