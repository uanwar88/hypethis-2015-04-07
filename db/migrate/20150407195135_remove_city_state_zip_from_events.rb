class RemoveCityStateZipFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :city, :string
    remove_column :events, :state, :string
    remove_column :events, :zip, :integer
  end
end
