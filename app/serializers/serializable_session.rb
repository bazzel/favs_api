class SerializableSession < JSONAPI::Serializable::Resource
  type 'sessions'

  attributes :id, :email
end

