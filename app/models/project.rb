class Project < ApplicationRecord
  belongs_to :user

  has_many :todos, dependent: :destroy

  validates :name, :user, presence: true

  validates :name, uniqueness: { scope: :user_id }
end
