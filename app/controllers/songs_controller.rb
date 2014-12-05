class SongsController < ApplicationController
  protect_from_forgery :except => :create 
  def create
    puts "===>>>>>>>> In create method of messaging service"
    puts "params #{params}"
    render json: {:message => "You got it!!!"}
  end
end
