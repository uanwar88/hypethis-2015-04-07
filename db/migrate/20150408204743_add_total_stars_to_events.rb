class AddTotalStarsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :total_stars, :integer
  end
end
