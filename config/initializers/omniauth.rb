Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, "8b7f62119be175aa398e", "26984d5f2229a79a9785d1c602dc40e4800df75a"
  else 
    # 本番環境用
    provider :github,
      Rails.application.credentials.github[:client_id],
      Rails.application.credentials.github[:client_secret]
  end
end