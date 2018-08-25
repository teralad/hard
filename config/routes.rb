Rails.application.routes.draw do
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
