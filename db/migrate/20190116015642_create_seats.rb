class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.integer :position
      t.integer :table_id

      t.timestamps
    end
  end
end
