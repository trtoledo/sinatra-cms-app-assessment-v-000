class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :letter
      # t.string :table1
      # t.string :table2
      # t.string :table3
      # t.string :table4
      # t.string :table5

      t.integer :server_id

      t.timestamps
    end
  end
end
