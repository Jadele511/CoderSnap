class Message < ActiveRecord::Base
	belongs_to :sender, class_name: "User"
	belongs_to :recipient, class_name:"User"

	def read?
		!!read_at
	end

	validates :body, presence: true

end

