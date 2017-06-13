require 'rails_helper'

RSpec.describe "emails/index", type: :view do
  before(:each) do
    assign(:emails, [
      Email.create!(
        :subject => "Subject",
        :message => "MyText",
        :mark => false,
        :resent => 2
      ),
      Email.create!(
        :subject => "Subject",
        :message => "MyText",
        :mark => false,
        :resent => 2
      )
    ])
  end

  it "renders a list of emails" do
    render
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
