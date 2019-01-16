class CreateServersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
    end
  end
end
