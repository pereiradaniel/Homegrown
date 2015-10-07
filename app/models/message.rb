class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :sender, class_name: User
  validates :title, presence: true
  validates :content, presence: true
end
