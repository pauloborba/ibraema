class Company < User
  alias_attribute :cnpj, :identifier
end