class Institution < ApplicationRecord
  name :string, presence: true
  cnpj :string, presence: true, length: {is: 11}

  belongs_to :coaching_activity
end
