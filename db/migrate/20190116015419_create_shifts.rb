class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.integer :number
      t.integer :start_time
      t.integer :end_time
      t.integer :manager_id

      t.timestamps null: false
    end
  end
end
