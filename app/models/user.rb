class User < ActiveRecord::Base
  has_many :events
  has_many :stars
end
