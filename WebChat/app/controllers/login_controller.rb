class LoginController < ApplicationController
  def index
  end

  def login_verify
    @chat_user = ChatUser.where(:login => params['login'],
                                :password => params['password']).first
    if @chat_user == nil
      redirect_to :root
    else
      session[:login] = @chat_user.login
      if params[:isadmin] == '1'
        role_status = @chat_user.role.role
        if role_status == 'admin'
          session[:admin] = true
          redirect_to admin_index_path
        else
          redirect_to :root
        end
      else
        redirect_to :root
      end
    end
  end
end