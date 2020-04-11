Rails.application.routes.draw do
  root to: "produtos#index"
  resources :produtos, only: [:new, :create, :destroy, :edit, :update, :show] do
    collection do
      get :busca
    end
  end
end
