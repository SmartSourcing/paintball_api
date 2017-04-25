if Rails.env.production?
  bucket = "paintball-tournament"
elsif Rails.env.testing?
  bucket = "paintball-tournament-stg"
else
  bucket = "paintball-tournament-dev"
end

CarrierWave.configure do |config|

  config.storage         = :fog
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: '',
      aws_secret_access_key: ''
  }
  config.fog_directory        = bucket
  config.fog_use_ssl_for_aws  = false
end
