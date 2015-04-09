class AddStarsCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :stars_count, :integer
  end
end
