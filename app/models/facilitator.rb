class Facilitator < ApplicationRecord
  belongs_to :institution
  has_and_belongs_to_many :coaching_activities

  validates :cpf, uniqueness: true
end
