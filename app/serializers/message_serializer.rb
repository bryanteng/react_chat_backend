class MessageSerializer < ActiveModel::Serializer
  attributes :context, :user, :created_at, :classroom_id
  belongs_to :user
  belongs_to :classroom
end
