class ChatroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
    flash[:success] = "You have joined the '#{@chatroom.name}' chatroom."

    redirect_to @chatroom
  end

  def destroy
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
    flash[:danger] = "You have quit the '#{@chatroom.name}' chatroom."

    redirect_to chatrooms_path
  end

  private
    def set_chatroom
      @chatroom = Chatroom.find(params[:chatroom_id])
    end
end
