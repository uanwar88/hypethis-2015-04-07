class User < ActiveRecord::Base
  has_many :events, dependent: :delete
  has_many :stars, dependent: :delete
  has_many :starred_events, through: :stars, source: :event
end

# @users = User.includes(:starred_events)
