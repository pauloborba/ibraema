class CreateFacilitators < ActiveRecord::Migration[5.0]
  def change
    create_table :facilitators do |t|
      t.string :name
      t.string :cpf
      t.belongs_to :institution, index: true, foreign_key: true
  
      t.timestamps
    end
    
    create_table :coaching_activities_facilitators, id: false do |t|
      t.belongs_to :coaching_activity, index: true
      t.belongs_to :facilitator, index: true
    end
  end
end
