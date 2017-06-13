require 'rails_helper'

RSpec.describe "emails/new", type: :view do
  before(:each) do
    assign(:email, Email.new(
      :subject => "MyString",
      :message => "MyText",
      :mark => false
    ))
  end

  it "renders new email form" do
    render

    assert_select "form[action=?][method=?]", emails_path, "post" do

      assert_select "input#email_subject[name=?]", "email[subject]"

      assert_select "textarea#email_message[name=?]", "email[message]"

      assert_select "input#email_mark[name=?]", "email[mark]"
    end
  end
end
