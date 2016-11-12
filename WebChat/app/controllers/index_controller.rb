class IndexController < ApplicationController
  def index
    if (session[:login != nil])
      redirect to chat
    end
  end
end
