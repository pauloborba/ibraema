class ChangeDataTypeForMessage < ActiveRecord::Migration[5.0]
  def change
    change_column :emails, :message, :text
  end
end
