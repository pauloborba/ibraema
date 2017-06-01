class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :nome
      t.integer :versao

      t.timestamps
    end
  end
end
