class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :category
  has_many :stars, dependent: :delete_all

  scope :between_dates, lambda{|start_date,end_date| where("start_time >= ? and start_time <= ?", start_date, end_date)}
  scope :category, ->(category_id) { where(category_id:  category_id) }
end
