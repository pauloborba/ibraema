class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :subject
      t.text :message
      t.boolean :mark

      t.timestamps
    end
  end
end
