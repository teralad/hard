class Types::QuestionType < Types::BaseObject
    graphql_name 'Question'
  
    field :id, Integer, null: true
    field :name, String, null: true
    field :options, [Types::OptionType, null: true], null: true

end