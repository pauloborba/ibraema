class CreateCoachingActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :coaching_activities do |t|
      t.timestamp :start_date
      t.timestamp :finish_date
      t.belongs_to :institution, index: true, foreign_key: true

      t.timestamps
    end
  end
end
