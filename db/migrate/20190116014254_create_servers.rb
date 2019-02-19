class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :section

      t.timestamps
    end

    end
  end
