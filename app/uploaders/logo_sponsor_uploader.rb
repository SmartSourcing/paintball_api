# encoding: utf-8

class LogoSponsorUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :file #fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [125, 64]
  end

  version :mobile do
    process :resize_to_fit => [50, 50]
  end
end
