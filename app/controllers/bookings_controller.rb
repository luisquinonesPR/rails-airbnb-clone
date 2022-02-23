class BookingsController < ApplicationController
  before_action :set_cow, only: [ :new, :create ]

  def index
    @sent_bookings = current_user.sent_bookings
    @received_bookings = current_user.received_bookings

    @accepted_bookings = @received_bookings.where(status: "accepted")
  end

  def accept
    @booking = booking.find(params[:booking_id])
    booking.status = "accepted"
  end

  def reject
    @booking = Booking.find(params[:booking_id])
    booking.status = "rejected"
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.cow = @cow
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      flash[:alert] = "Cow has already been taken. Choose other dates"
      render :new
    end
  end

  def new
    @booking = Booking.new
  end

  private

  def set_cow
    @cow = Cow.find(params[:cow_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
