class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_many :stars
end
