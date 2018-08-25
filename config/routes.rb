Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"

  post "/graphql", to: "graphql#execute"
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :answers
  resources :questions
  resources :exams do
    get :exam_summary, :on => :collection
  end

end
