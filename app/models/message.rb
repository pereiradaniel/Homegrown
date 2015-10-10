class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :sender, class_name: User
  validates :content, presence: true
end
