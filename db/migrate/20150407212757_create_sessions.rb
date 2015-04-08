class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :login
      t.string :create
      t.string :destroy

      t.timestamps null: false
    end
  end
end
