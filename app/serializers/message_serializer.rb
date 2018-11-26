class MessageSerializer < ActiveModel::Serializer
  attributes :context, :user, :created_at
  belongs_to :user

end
