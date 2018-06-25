class WelcomeController < ApplicationController
  def index
  end 

  def new
    
  end 

  def create
    @buddy = Buddy.create(buddy_params)
    if @buddy.save
      redirect_to thank_you_path
    else
      render :index
    end
  end

  def thank_you
    
  end 

  def buddy_params
    params.permit(:email, :name, :goal)
  end 
end
