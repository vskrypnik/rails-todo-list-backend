class TodoSerializer < ActiveModel::Serializer
  attributes :name, :done, :priority, :deadline

  belongs_to :project
end
