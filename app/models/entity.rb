class Entity < ApplicationRecord
  belongs_to :users, class_name: 'User'
  has_many :groups
end
