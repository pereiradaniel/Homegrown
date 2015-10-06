class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :product

  validates :title, presence: true
  validates :content, presence: true
end
