class UserSerializer < ActiveModel::Serializer
  attributes  :id, :full_name,  :born_on, :is_admin

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end