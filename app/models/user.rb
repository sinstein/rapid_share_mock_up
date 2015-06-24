class User < ActiveRecord::Base
  has_many :attachments
  has_secure_password

  validates :username, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 6 }, allow_nil: true
end
