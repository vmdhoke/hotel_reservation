class BookingController < ApplicationController
  before_action :authenticate_user! , only: [:create]
  
  def index
    @room_types = RoomType.all
    if params[:start_date].present?
      available_roooms
    end
    if current_user.present?
      @bookings = current_user.bookings
    end
  end
  
  def create
    available_roooms
    if @available_room_ids.present?
      @book = Booking.new(room_id: @available_room_ids.first,booking_from: @start_date,booking_to: @end_date, user_id: current_user.id, payment: ((@end_date - @start_date).to_i * @room_type.tariff) )
      if @book.save
        @room_types = RoomType.all
        @bookings = current_user.bookings
        render 'index'
      else
        # add bootstrap and flashes
        flash[:notice] = @book.errors.messages.values
        redirect_to root_path
      end
    else
      redirect_to root_path
    end 
  end

  private
    def available_roooms
      @start_date = params[:start_date].to_datetime.beginning_of_day
      @end_date = params[:end_date].to_datetime.end_of_day
      @room_type = RoomType.find_by(name:params[:room_type])
      required_room_ids = @room_type.rooms.ids
      room_ids = Booking.where(room_id: required_room_ids)
        .where('(booking_from >= ? and booking_to <= ?) or (booking_from > ? and booking_to > ? and booking_from < ?) or (booking_from < ? and booking_to > ?)',@start_date,@end_date,@start_date,@end_date,@end_date,@start_date,@start_date)
        .pluck(:room_id)
      @available_room_ids = required_room_ids - room_ids
    end
end