class User < ActiveRecord::Base
  has_secure_password

  has_many :orgs
  has_many :members
  has_many :memberships, through: :members, source: :membership

  validates :firstname, :lastname, presence: true 
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email, presence: true 
  
  def email= email
    super(email.try(:downcase))
  end

  validates :password, length: {in: 8..30}
  # validates :password, presence: true, length: {in: 8..30}, on: :create

end
