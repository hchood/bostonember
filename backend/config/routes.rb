Rails.application.routes.draw do
  namespace :api do
    resources :speakers, only: [:index, :show]
  end
end
