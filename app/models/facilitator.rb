class Facilitator < ApplicationRecord
  name :string, presence: true
  cpf :string, presence: true, length: {is: 11}

  belongs_to :coacing_activity
end
