class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true
      t.string :title
      t.text :description
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.datetime :start_time
      t.datetime :end_time
      t.string :website
      t.string :ticket_details
      t.string :facebook

      t.timestamps null: false
    end
    add_foreign_key :events, :users
  end
end
