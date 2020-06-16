require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
  before(:each) do
    assign(:bookings, [
      Booking.create!(
        status: "Status",
        cancellation_reason: "MyText"
      ),
      Booking.create!(
        status: "Status",
        cancellation_reason: "MyText"
      )
    ])
  end

  it "renders a list of bookings" do
    render
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
