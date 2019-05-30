class User < ApplicationRecord
  has_secure_token :authentication_token

  has_many :books, dependent: :destroy

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  before_create :encrypt_password

  def self.encrypt(input_string)
    Base64.encode64(input_string)
  end

  def self.decrypt(encrypted_string)
    Base64.decode64(encrypted_string)
  end

  private

  def encrypt_password
    self.password = User.encrypt(password)
  end
end
