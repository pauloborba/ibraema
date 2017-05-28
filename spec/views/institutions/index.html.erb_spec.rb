require 'rails_helper'

RSpec.describe "institutions/index", type: :view do
  before(:each) do
    assign(:institutions, [
      Institution.create!(
        :nome => "Nome",
        : => "",
        :cnpj => "Cnpj",
        : => ""
      ),
      Institution.create!(
        :nome => "Nome",
        : => "",
        :cnpj => "Cnpj",
        : => ""
      )
    ])
  end

  it "renders a list of institutions" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
