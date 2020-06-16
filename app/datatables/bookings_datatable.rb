class BookingsDatatable < ApplicationDatatable
  delegate :edit_booking_path, to: :@view


  private

    def data
      bookings.map do |booking|
        [].tap do |column|
          dateTime = []
          dateTime << booking.reservation_date.strftime("%d %b %Y")
          dateTime << booking.reservation_time.strftime("%I:%M %P") 
          column << dateTime.join(' - ')
          column << booking.reservation_end_time.strftime("%I:%M %P") 
          column << booking.room.room_name
          column << booking.room.room_type
          column << booking.booking_reason
          column << booking.status

          links = []
          # links << link_to('Show', booking)
          # links << link_to('Edit', edit_booking_path(booking))
          links << link_to('Cancel', booking, method: :delete, data: { confirm: 'Are you sure?' })
          column << links.join(' | ')
        end
      end
    end


    def count
      Booking.count
    end

    def total_entries
      bookings.total_count
    end

    def bookings
      @bookings ||= fetch_bookings
    end


    def fetch_bookings
      search_string = []

      search_array = ["reservation_date","reservation_end_time","status","booking_reason"]
      search_array.each do |term|
        search_string << "#{term} like :search"
      end
 
      # will_paginate
      if sort_column == "facility"
        bookings = Booking.where(user_id: @current_user)
        bookings = bookings.joins(:room).order("rooms.room_name #{sort_direction}")
      elsif sort_column == "room_type"
        bookings = Booking.all 
        bookings = bookings.joins(:room).order("rooms.room_type #{sort_direction}")
      else
        bookings = Booking.where(user_id: @current_user).order("#{sort_column} #{sort_direction}")
      end
      bookings = bookings.page(page).per(per_page)

      if params[:search][:value].include? "meeting" or params[:search][:value].include? "facility"
        bookings = bookings.joins(:room).where('rooms.room_type like ?',"%#{params[:search][:value]}%")
      elsif params[:search][:value].include? "l" or params[:search][:value].include? "L"
        bookings = bookings.joins(:room).where('rooms.room_name like ?',"%#{params[:search][:value]}%")
      else
        bookings = bookings.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
      end
    end

    def columns
      %w(reservation_date reservation_end_time facility room_type booking_reason status )
    end
  
end