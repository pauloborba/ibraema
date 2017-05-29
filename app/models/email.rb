class Email < ApplicationRecord
    subject :string, presence: true
    message :string, presence: true
    mark :boolean, default: false
end
