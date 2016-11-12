class HelloController < ApplicationController
  def index
  end
  def hello_handler
    if (cookies[:name] == nil)
      @name = params["Name"]
      #пише что в нейме хелло индекс
      #cookies[:name] = {:value=> @name, :expires => 1.year.from_now}
      session[:name] = @name
    else
      @name = session[:name]
    end
  end

end