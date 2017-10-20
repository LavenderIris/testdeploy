class Org < ActiveRecord::Base
  belongs_to :user
  has_many :members, dependent: :destroy

  validates :name, length: {minimum: 6}, presence: true
  validates :desc, length: {minimum: 11}, presence: true

end
