class ChangeDefaultStarsCount < ActiveRecord::Migration
  def change
    change_column_default :events, :stars_count, 0
  end
end
