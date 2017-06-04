class Book < ApplicationRecord
  validates :nome, presence: {message: "Um Livro precisa de um nome."}
  validates :versao, presence: {message: "A versão não pode ser vazia."}
  validates :nome, uniqueness: {message: "Livro ja cadastrado."}

  before_save :check_blank_name

  def check_blank_name
    return false if self.nome.blank? == true
  end
end
