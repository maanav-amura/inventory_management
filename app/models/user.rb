class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :age, numericality: { greater_than: 0, less_than_or_equal_to: 99 }

  has_many :invoice_bills
  belongs_to :factory
end
