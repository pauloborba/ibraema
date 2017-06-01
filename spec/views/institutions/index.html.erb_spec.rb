require 'rails_helper'

RSpec.describe "institutions/index", type: :view do
  before(:each) do
    assign(:institutions, [
      Institution.create!(
        :name => "Name",
        :cnpj => "Cnpj",
        :facilitator => ""
      ),
      Institution.create!(
        :name => "Name",
        :cnpj => "Cnpj",
        :facilitator => ""
      )
    ])
  end

  it "renders a list of institutions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
