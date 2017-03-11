class Todo < ApplicationRecord
  belongs_to :project

  acts_as_list scope: :project, column: :priority

  validates :name, :project, presence: true

  validates :name, uniqueness: { scope: :project_id }

  validates :done, inclusion: [true, false]

  default_scope -> { order :done, :priority }
end
