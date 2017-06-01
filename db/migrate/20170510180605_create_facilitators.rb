class CreateFacilitators < ActiveRecord::Migration[5.0]
  def change
    create_table :facilitators do |t|
      t.string :nome
      t.string :cpf
      
      t.timestamps
    end
  end
end
