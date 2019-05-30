class Types::BookType < Types::BaseObject
  description 'A book that the user has'
  field :id, ID, null: false
  field :title, String, null: false
end
