class User < ActiveRecord::Base
  has_many :events, dependent: :delete_all
  has_many :stars, dependent: :delete_all
  has_many :starred_events, through: :stars, source: :event

  validates :username, presence: true, uniqueness: true, length: { within: 4..20 },
    format: { with: /\A[a-zA-Z0-9_-]+\Z/ }
  validates :email, presence: true, uniqueness: true, format: { with: /@/ }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, if: lambda{ new_record? || !password.nil? }
  validates :password_confirmation, presence: true, if: lambda{ new_record? || !password.nil? }
end

# @users = User.includes(:starred_events)
