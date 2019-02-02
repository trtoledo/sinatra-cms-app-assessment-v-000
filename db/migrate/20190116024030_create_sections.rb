class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :letter

      t.integer :server_id

      t.timestamps null: false
    end
  end
end
