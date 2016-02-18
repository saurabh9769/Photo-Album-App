class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :passoword_hash
      t.string :password_salt

      t.timestamps null: false
    end
  end
end