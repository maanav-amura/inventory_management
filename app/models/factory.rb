#
# Class Factory provides model for factory
#
# @author Maanav Shah <maanav@amuratech.com>
#
class Factory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :city

  has_many :users
  has_many :products

  validates :name, presence: true, uniqueness: true
end
