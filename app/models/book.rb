class Book < ApplicationRecord
  validates :nome, presence: {message: " é obrigatório."}
  validates :versao, presence: {message: "não pode ser vazia."}
  validates :nome, uniqueness: {message: "do livro ja cadastrado."}

  before_save :check_blank_name

  def check_blank_name
    return false if self.nome.blank? == true
  end
end
