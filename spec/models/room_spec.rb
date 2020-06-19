require 'rails_helper'

RSpec.describe Room, type: :model do
	subject { described_class.new(
		room_name:"Anything",
		floor:2,
		room_type:"Meeting Room"
	) }

   	it "is valid with valid attributes" do
	    expect(subject).to be_valid
   	end

	it "is not valid without a name" do
		subject.room_name = nil
    	expect(subject).to_not be_valid
	end


	it "is not valid without a floor" do
		subject.floor = nil
    	expect(subject).to_not be_valid
	end

	it "is not valid without a type" do
		subject.room_type = nil
    	expect(subject).to_not be_valid
	end

	it "is invalid with a duplicate room name" do
		subject.room_name = "New Name"
		subject.valid?
		expect(room.errors[:room_name]).to include("has already been taken")
	end
end
