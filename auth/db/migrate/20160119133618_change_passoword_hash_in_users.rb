class ChangePassowordHashInUsers < ActiveRecord::Migration
  def change
  	rename_column(:users, :passoword_hash, :password_hash)
  end
end
