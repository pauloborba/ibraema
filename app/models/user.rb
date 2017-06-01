class User < ApplicationRecord
	validates :nome, presence: true
end
