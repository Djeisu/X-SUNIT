Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      # resources :survivors
      # resources :report_abducted
      
      get   '/survivors/', to: 'survivors#index'
      get   '/survivors/:id', to: 'survivors#show'
      post  '/survivors/', to: 'survivors#create'
      put   '/survivors/update-location/:id', to: 'survivors#updateLocation'

      post  '/report/', to: 'report_abducted#report'
    end
  end
end
