class SessionResource < JSONAPI::Resource
  model_name 'User'

  attributes :email
end
