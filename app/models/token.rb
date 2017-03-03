class Token < ActiveRecord::Base

  before_validation :generate_access_token, on: :create

  # SecureRandom.hex (provided in Ruby 1.9) generate a random hexadecimal string.
  # It then checks to see if another key exists with the same token and
  # regenerates the token if this is the case.
  def generate_access_token
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end
end
