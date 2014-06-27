def create_note(updated_attributes = {})
  #user must me handed in to be associated with a note
  default_attributes = {
      :note => "This is a note created by a logged in User",
      :tag => "testing",
      :title => "Test Note",
  }
  attributes = default_attributes.merge(updated_attributes)

  Note.create(attributes)

end

def create_user(updated_attributes = {})
  default_attributes = {
      :email => "example@example.com",
      :password => "password1"
  }
  attributes = default_attributes.merge(updated_attributes)

  User.create(attributes)

end


def create_search(updated_attributes = {})
  #user must be handed in to be association with a search
  default_attributes = {
      :state => "CO",
      :bill => "HB1030"
  }
  attributes = default_attributes.merge(updated_attributes)

  Search.create(attributes)

end