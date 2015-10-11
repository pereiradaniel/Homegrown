class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_one :garden
  has_many :products, through: :garden
  has_many :messages, through: :product
  has_many :trades

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: "not a valid email address" } 
  validates :name, presence: true
end
