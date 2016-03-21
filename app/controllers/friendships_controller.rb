class FriendshipsController < ApplicationController

	def index
		@user =User.all

	end

	def new_friend
      @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	  @friendship.user_id = current_user.id
		respond_to do |format|
	      if @friendship.save
	        format.html { redirect_to new_friend_path, notice: 'Friend was successfully added.' }
	        format.json { render :show, status: :created, location: @friendship }
	      else
	        format.html { render :new }
	        format.json { render json: @friendship.errors, status: :unprocessable_entity }
	      end
	    end
	 end
	 

	 def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
    end
end
