class Company < User
  alias_attribute :cnpj, :identifier

  def self.constantize
    'Company'
  end
end
