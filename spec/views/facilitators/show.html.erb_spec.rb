require 'rails_helper'

RSpec.describe "facilitators/show", type: :view do
  before(:each) do
    @facilitator = assign(:facilitator, Facilitator.create!(
      :name => "Name",
      :cpf => "Cpf",
      :institution => nil,
      :coaching_activity => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
