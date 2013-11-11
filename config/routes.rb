Squeaker::Application.routes.draw do
  resource :user_session
  resources :messages
  match "search", controller: "search", action: "search_users"
  match "follow", controller: "users", action: "follow"
  resources :users do
    resources :messages
  end
  match "reset", controller: "resets", action: "create"
  root controller: "messages", action: 'index'
end
