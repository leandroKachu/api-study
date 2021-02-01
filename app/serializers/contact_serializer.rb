class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthday
  belongs_to :kind
  has_many :phones
  has_one :address
end
