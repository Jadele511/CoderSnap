class FriendshipsController < ApplicationController

	def index
		@user =User.all

	end

	def new_friend
	  @friendship = Friendship.new(:friend_id => params[:friend_id])
	  @friendship.user_id = current_user.id
		respond_to do |format|
	      if @friendship.save
	        format.html { redirect_to @friendship, notice: 'Friend was successfully added.' }
	        format.json { render :show, status: :created, location: @friendship }
	      else
	        format.html { render :new }
	        format.json { render json: @friendship.errors, status: :unprocessable_entity }
	      end
	    end
	 end
	 redirect_to friendship_index_path
end
