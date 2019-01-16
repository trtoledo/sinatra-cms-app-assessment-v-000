class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :number
      t.timestamps :start_time
      t.timestamps :end_time
      t.integer :manager_id

      t.timestamps null: false
    end
  end
end
