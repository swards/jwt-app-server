class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :username
  attribute :created_date do |user|
    user.created_at.strftime('%d/%m/%Y')
  end
end
