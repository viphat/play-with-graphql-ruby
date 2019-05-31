class Resolvers::QueryTypes::UserResolver < Resolvers::BaseResolver
  type Types::UserType, null: false
  argument :id, ID, required: true

  def resolve(**args)
    User.find(args[:id])
  end
end
