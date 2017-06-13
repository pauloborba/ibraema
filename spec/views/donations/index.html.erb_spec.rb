require 'rails_helper'

RSpec.describe "donations/index", type: :view do
  before(:each) do
    assign(:donations, [
      Donation.create!(
        :amount => "9.99",
        :user => nil
      ),
      Donation.create!(
        :amount => "9.99",
        :user => nil
      )
    ])
  end

  it "renders a list of donations" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
