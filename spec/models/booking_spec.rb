require 'rails_helper'

RSpec.describe Booking, type: :model do
	 context 'ActiveRecord associations' do
	    it 'belongs to user' do
	      expect(Booking.reflect_on_association(:user).macro).to be (:belongs_to)
	    end

	     it 'belongs to room' do
	      expect(Booking.reflect_on_association(:room).macro).to be (:belongs_to)
	    end
	  end

	now = Time.now.utc
	oneHourLater = now + 7200
	subject { described_class.new(
		reservation_date: now,
		reservation_time: now,
		reservation_end_time: oneHourLater,
		room_id: 1,
		user_id: 1
	) }

	

	it "is not valid without reservation_date" do
		subject.reservation_date = nil
    	expect(subject).to_not be_valid
	end


	it "is not valid without reservation_time" do
		subject.reservation_time = nil
    	expect(subject).to_not be_valid
	end

	it "is not valid without reservation_end_time" do
		subject.reservation_end_time = nil
    	expect(subject).to_not be_valid
	end

	it "is not valid without user id" do
		subject.room_id = nil
    	expect(subject).to_not be_valid
	end

	it "is not valid without user id" do
		subject.user_id = nil
    	expect(subject).to_not be_valid
	end

	
end
