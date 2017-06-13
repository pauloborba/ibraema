require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :nome => "MyString",
      :versao => 1
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input#book_nome[name=?]", "book[nome]"

      assert_select "input#book_versao[name=?]", "book[versao]"
    end
  end
end
