class Group < ApplicationRecord
  belongs_to :users, class_name: 'User', foreign_key: 'users_id'
  has_many :entities

  validates :name, presence: true
  validates :icon, presence: true

  def total
    entities.sum(:amount)
  end
end
