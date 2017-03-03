if Rails.env.production?
  bucket = "pb-api"
elsif Rails.env.testing?
  bucket = "pb-api-stg"
else
  bucket = "pb-api-dev"
end

CarrierWave.configure do |config|

  config.storage        = :fog
  config.fog_directory  = bucket
  config.cache_dir      = "#{Rails.root}/tmp/uploads"
end
