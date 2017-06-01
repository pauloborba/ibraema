require 'rails_helper'

RSpec.describe "facilitators/index", type: :view do
  before(:each) do
    assign(:facilitators, [
      Facilitator.create!(
        :name => "Name",
        :cpf => "Cpf",
        :institution => nil
      ),
      Facilitator.create!(
        :name => "Name",
        :cpf => "Cpf",
        :institution => nil
      )
    ])
  end

  it "renders a list of facilitators" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
