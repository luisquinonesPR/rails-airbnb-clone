class BookingsController < ApplicationController
  before_action :set_cow, only: [ :new, :create ]
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :accept, :decline]

  def index
    @sent_bookings = current_user.sent_bookings
    @received_bookings = current_user.received_bookings
  end

  def accept
    @booking.confirmed!
    redirect_to bookings_path, notice: "You have successfully confirmed this booking request"
  end

  def decline
    @booking.declined!
    redirect_to bookings_path, notice: "You have declined this booking request"
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.cow = @cow
    @booking.user = current_user
    @booking.status = 0
    if @booking.save
      redirect_to bookings_path, notice: "You booked your cow! We need to wait for confirmation."
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

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
