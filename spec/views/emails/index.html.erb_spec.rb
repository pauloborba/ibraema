require 'rails_helper'

RSpec.describe "emails/index", type: :view do
  before(:each) do
    assign(:emails, [
      Email.create!(
        :subject => "Subject",
        :message => "Message",
        :mark => false
      ),
      Email.create!(
        :subject => "Subject",
        :message => "Message",
        :mark => false
      )
    ])
  end

  it "renders a list of emails" do
    render
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
