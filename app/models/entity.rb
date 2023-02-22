class Entity < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :group, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
