class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :groups, foreign_key: "users_id"
  has_many :entities, foreign_key: "users_id"

  validates :name, presence: true
end
