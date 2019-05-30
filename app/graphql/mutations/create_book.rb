class Mutations::CreateBook < Mutations::BaseMutation
  argument :title, String, required: true

  field :book, Types::BookType, null: true
  field :errors, [String], null: false

  def resolve(title:)
    current_user = context[:current_user]
    fail Exceptions::AuthenticationRequired if current_user.nil?
    book = current_user.books.create(title: title)

    if book.persisted?
      return {
        book: book,
        errors: []
      }
    end

    {
      book: nil,
      errors: book.errors.full_messages
    }
  end
end
