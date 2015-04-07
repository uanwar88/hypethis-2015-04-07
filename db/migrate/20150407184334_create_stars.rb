class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :stars, :users
    add_foreign_key :stars, :events
  end
end
