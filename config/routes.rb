Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      	token_validations: 'api/v1/auth/token_validations',
      	registrations:		 'api/v1/auth/registrations',
      	sessions: 				 'api/v1/auth/sessions'
      }

      get 'users/validate-email-uniqueness'

      resources :projects, except: %i(new edit) do
        resources :todos, only: %i(index create)
      end

      resources :todos, only: %i(show update destroy)
    end
  end
end
