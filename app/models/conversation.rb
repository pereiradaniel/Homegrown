class Conversation < ActiveRecord::Base
	has_many :messages
	belongs_to :product
	belongs_to :sender, class_name: User
end
