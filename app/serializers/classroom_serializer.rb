class ClassroomSerializer < ActiveModel::Serializer
  attributes :id, :name, :subject
  has_many :messages
end
