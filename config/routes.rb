Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      # resources :survivors
      # resources :report_abducted
      
      #survivors
      get   '/survivors/', to: 'survivors#index'
      get   '/survivors/:id', to: 'survivors#show'
      post  '/survivors/', to: 'survivors#create'
      put   '/survivors/update-location/:id', to: 'survivors#updatelocation'

      
      
      #Reports
      post  '/report/', to: 'report_abducted#report'
      get   '/report/abducteds', to: 'survivors#abducteds'
      get   '/report/non-abducteds', to: 'survivors#nonabducteds'
      get   '/report/survivors', to: 'survivors#allsurvivors'
      get   '/report/last-location/:id', to: 'survivors#lastlocation'
    end
  end
end
