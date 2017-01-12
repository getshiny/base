Rails.application.routes.draw do
  get 'health-check', to: 'welcome#health_check'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
