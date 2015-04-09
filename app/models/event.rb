class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :category
  has_many :stars, dependent: :delete_all
end
