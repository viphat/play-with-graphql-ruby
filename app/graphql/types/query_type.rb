module Types
  class QueryType < Types::BaseObject
    field :users, resolver: Resolvers::QueryTypes::UsersResolver
    field :user, resolver: Resolvers::QueryTypes::UserResolver
  end
end
