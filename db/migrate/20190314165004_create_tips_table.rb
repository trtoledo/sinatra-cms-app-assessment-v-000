class CreateTipsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.integer :amount
      t.integer :server_id
      t.integer :table_id

      t.timestamps
    end
  end
end
