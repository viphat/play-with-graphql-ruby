class GraphqlRailsSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  default_max_page_size 10
  rescue_from(ActiveRecord::RecordNotFound) { "Not found" }
end
