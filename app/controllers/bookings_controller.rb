class BookingsController < ApplicationController
  before_action :set_cow, only: [ :new, :create ]

  def create
    @booking = Booking.new(booking_params)
    @booking.cow = @cow
    @booking.user = current_user
    if @booking.save
      redirect_to cow_bookings_path(@cow)
    else
      redirect_to cow_path(@cow)
    end
  end

  private

  def set_cow
    @cow = Cow.find(params[:cow_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
