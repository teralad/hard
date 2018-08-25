class HardSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query_analyzer AuthorizationAnalyzer.new
  query(Types::QueryType)
end
