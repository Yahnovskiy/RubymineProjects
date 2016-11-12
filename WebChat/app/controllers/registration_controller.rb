class RegistrationController < ApplicationController
  def index
@chat_user = ChatUser.new()
  end


  def create
    @chat_user = ChatUser.new(user_params)
    @chat_user.role = Role.where(:role => 'user').first
    if @chat_user.save
      redirect_to :root
    end

  end

  private
  def user_params
    params.require(:chat_user).permit(:name, :login, :password)
  end
end
