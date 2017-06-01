require 'rails_helper'

RSpec.describe "emails/show", type: :view do
  before(:each) do
    @email = assign(:email, Email.create!(
      :subject => "Subject",
      :message => "Message",
      :mark => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/Message/)
    expect(rendered).to match(/false/)
  end
end
