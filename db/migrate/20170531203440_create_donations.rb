class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.decimal :amount
      t.timestamp :last_execution
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
