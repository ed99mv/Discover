Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :users, :reservations, :tours, :galleries, :companies, defaults: { format: 'json' } do
        member do
          get 'galleries' # Ruta para la acción 'galleries' de un tour específico
        end
      end
    end
  end
end