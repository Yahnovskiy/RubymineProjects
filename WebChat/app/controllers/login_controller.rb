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
    redirect_to :root
    end
    end
  end
