class User < ActiveRecord::Base
  has_many :attachments
  has_secure_password
  before_validation :downcase_email
  
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, confirmation: true, length: { minimum: 6 }, allow_nil: true

  def before_save
  	self.email.downcase!
  end

  def downcase_email
    self.email.downcase!
  end
end
