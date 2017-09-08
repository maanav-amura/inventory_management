class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :name
  field :age
  field :type
  field :factory

  ## Database authenticatable
  field :email,              type: String
  field :encrypted_password, type: String
  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time
  ## Rememberable
  field :remember_created_at, type: Time
  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  has_many :invoice_bills
  belongs_to :factory

  validates :name, presence: true
  validates :age, numericality: { greater_than: 0, less_than_or_equal_to: 99 }
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8, maximum: 16 }
end
