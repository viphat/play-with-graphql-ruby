class Types::UserType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :email, String, null: false
  field :authenticationToken, String, null: false
  field :createdAt, GraphQL::Types::ISO8601DateTime, null: false
  field :booksCount, Integer, null: false
  field :books, [Types::BookType], null: true

  def books_count
    object.books.size
  end
end
