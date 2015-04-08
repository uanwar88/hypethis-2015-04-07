class User < ActiveRecord::Base
  has_many :events
  has_many :stars
  has_many :starred_events, through: :stars, source: :event
end

# @users = User.includes(:starred_events)
