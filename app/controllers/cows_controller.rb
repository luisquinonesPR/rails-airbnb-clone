class CowsController < ApplicationController
  before_action :set_cow, only: [:show, :edit, :update, :destroy]
  
  def create
    @cow = Cow.new(cow_params)
    @cow.user = current_user
    if @cow.save
      redirect_to cow_path(@cow)
    else
      render :new
    end
  end

  def destroy
    @cow.destroy
    redirect_to root_path
  end

  def my_cows
    @cows = current_user.cows
  end

  private

  def set_cow
    @cow = Cow.find(params[:id])
  end

  def cow_params
    params.require(:cow).permit(:name, :description, :photo)
  end
end