class WelcomeController < ApplicationController
  def home
    @user = User.new
  end
  
  def new
    @user = User.new
  end
end
