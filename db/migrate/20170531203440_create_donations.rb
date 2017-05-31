class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.decimal :amount, precision: 12, scale: 2
      t.timestamp :last_execution, default: DateTime.now
      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
