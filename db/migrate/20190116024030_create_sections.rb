class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :letter

      t.integer :server_id

      t.timestamps 
    end
  end
end
