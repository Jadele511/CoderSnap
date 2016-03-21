class MessagesController < ApplicationController

	def index
		@message = Message.all
		@message = Message.order("created_at DESC")
		@received_messages = received_messages
	end

	def new
		@message = Message.new
		@recipient = current_user.friends
	end

	def create 
		@message = Message.new(message_params)
		@message.sender_id = current_user.id

		respond_to do |format|
	      if @message.save
	        format.html { redirect_to @message, notice: 'Message was successfully created.' }
	        format.json { render :show, status: :created, location: @message}
	      else
	        format.html { render :new }
	        format.json { render json: @message.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def show
    	@message = Message.find(params[:id])
    end

	def received_messages
    	Message.where(recipient_id: current_user.id).order('created_at DESC')
  	end

	def sent_messages
		Message.where(sender_id: current_user.id).order('created_at DESC')
	end
	
	def message_params
      params.require(:message).permit(:body, :sender_id, :recipient_id, :user_id)
    end
end
