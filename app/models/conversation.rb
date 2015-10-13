class Conversation < ActiveRecord::Base
	has_many :messages
	belongs_to :product
	belongs_to :sender, class_name: User
	belongs_to :receiver, class_name: User
	has_one :trade
end
