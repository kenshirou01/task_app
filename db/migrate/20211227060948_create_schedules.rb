class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :all, default: false, null: false
      t.string :note

      t.timestamps
    end
  end
end
