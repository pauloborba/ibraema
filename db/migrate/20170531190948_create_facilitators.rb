class CreateFacilitators < ActiveRecord::Migration[5.0]
  def change
    create_table :facilitators do |t|
      t.string :name
      t.string :cpf
      t.belongs_to :institution, index: true, foreign_key: true

      t.timestamps
    end
  end
end
