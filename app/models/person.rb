class Person < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_secure_password
  after_create :generate_auth_token

  private 
  def generate_auth_token
    Authentication.create(person_id: self.id, auth_token: SecureRandom.hex)
  end

  has_many :authentications
  has_many :reviews
  has_one :location
end
