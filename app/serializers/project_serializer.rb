class ProjectSerializer < ActiveModel::Serializer
  attributes :name

  has_many :todos
end
