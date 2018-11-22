class MessageSerializer < ActiveModel::Serializer
  attributes :context, :user
  belongs_to :user

end
