class User < ActiveRecord::Base
	has_secure_password

	validates :email, uniqueness: true
	validates :name, presence: true
	# def sent_messages
		#Message.where(sender_id: id)
	#end

	has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
	has_many :received_messages, foreign_key: 'recipient_id', class_name: 'Message'

	has_many :friendships
	has_many :friends, through: :friendships
end
