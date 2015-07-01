class User < ActiveRecord::Base
  has_many :attachments
  has_secure_password

  validates :email, uniqueness: true, :presence => true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, confirmation: true, length: { minimum: 6 }, allow_nil:
  true
  before_save :downcase_email

  def downcase_email
    self.email.downcase!
 end
end
