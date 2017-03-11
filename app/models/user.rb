class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :projects, dependent: :destroy
end
