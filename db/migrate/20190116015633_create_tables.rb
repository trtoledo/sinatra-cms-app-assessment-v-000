class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.integer :number
      t.integer :section_id

      t.timestamps
    end
  end
end
