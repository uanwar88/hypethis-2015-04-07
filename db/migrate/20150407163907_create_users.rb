class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :crypted_password
      t.string :salt
      t.string :company
      t.string :site
      t.string :avatar

      t.timestamps null: false
    end
  end
end
