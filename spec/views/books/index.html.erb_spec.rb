require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :nome => "Nome",
        :versao => 2
      ),
      Book.create!(
        :nome => "Nome",
        :versao => 2
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
