class CreateCoachingActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :coaching_activities do |t|
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
