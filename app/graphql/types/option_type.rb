class Types::OptionType < Types::BaseObject
    graphql_name 'Option'
    
    field :id, Integer, null: true
    field :name, String, null: true
    
end