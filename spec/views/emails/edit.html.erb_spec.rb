require 'rails_helper'

RSpec.describe "emails/edit", type: :view do
  before(:each) do
    @email = assign(:email, Email.create!(
      :subject => "MyString",
      :message => "MyText",
      :mark => false,
      :resent => 1
    ))
  end

  it "renders the edit email form" do
    render

    assert_select "form[action=?][method=?]", email_path(@email), "post" do

      assert_select "input#email_subject[name=?]", "email[subject]"

      assert_select "textarea#email_message[name=?]", "email[message]"

      assert_select "input#email_mark[name=?]", "email[mark]"

      assert_select "input#email_resent[name=?]", "email[resent]"
    end
  end
end
