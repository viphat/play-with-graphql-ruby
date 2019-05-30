module Types
  class MutationType < Types::BaseObject
    field :createUser, mutation: Mutations::CreateUser
    field :signInUser, mutation: Mutations::SignInUser
    field :createBook, mutation: Mutations::CreateBook
  end
end
