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
      aws_access_key_id: 'AKIAIUMSSQKKG6EIZWJA',
      aws_secret_access_key: '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'
  }
  config.fog_directory        = bucket
  config.fog_use_ssl_for_aws  = false
end
