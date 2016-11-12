class HelloController < ApplicationController
  def index
  end

  def form_handler
@name = params['Name']
  end
end
