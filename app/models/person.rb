class Person < User
  alias_attribute :cpf, :identifier

  def self.constantize
    'Person'
  end
end
