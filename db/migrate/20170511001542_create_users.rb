class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :token
    end
  end
end
