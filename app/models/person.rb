class Person < User
  alias_attribute :cpf, :identifier
end