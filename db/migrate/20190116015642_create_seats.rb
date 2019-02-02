class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :position
      t.integer :table_id

      t.timestamps null: false
    end
  end
end
