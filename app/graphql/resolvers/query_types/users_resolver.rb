class Resolvers::QueryTypes::UsersResolver < Resolvers::BaseResolver
  type [Types::UserType], null: false

  def resolve(**_args)
    User.all
  end
end
