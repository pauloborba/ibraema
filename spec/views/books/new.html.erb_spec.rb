require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :nome => "MyString",
      :versao => 1
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input#book_nome[name=?]", "book[nome]"

      assert_select "input#book_versao[name=?]", "book[versao]"
    end
  end
end
