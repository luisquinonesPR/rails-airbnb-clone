class CowsController < ApplicationController
  before_action :set_cow, only: [:show, :edit, :update, :destroy]

  def index
    @cows = Cow.where.not(user: current_user)
    @markers = @cows.geocoded.map do |cow|
      {
        lat: cow.latitude,
        lng: cow.longitude,
        info_window: render_to_string(partial: "info_window", locals: { cow: cow }),
        image_url: helpers.asset_url("cow.png")
      }
    end
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @cows = Cow.where(sql_query, query: "%#{params[:query]}%")
    else
      @cows
    end
  end

  def new
    @cow = Cow.new
  end

  def create
    @cow = Cow.new(cow_params)
    @cow.user = current_user
    if @cow.save
      redirect_to cow_path(@cow)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @cow.destroy
    redirect_to cows_path
  end

  def my_cows
    @cows = current_user.cows
  end

  private

  def set_cow
    @cow = Cow.find(params[:id])
  end

  def cow_params
    params.require(:cow).permit(:name, :description, :photo, :address)
  end
end
