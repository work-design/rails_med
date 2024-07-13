Rails.application.routes.draw do

  namespace 'med', defaults: { business: 'med' } do
    resources :diseases

    namespace :panel, defaults: { namespace: 'panel' } do
      root 'home#index'
      resources :symptoms do
        member do
          get :bodies
          get :causes
        end
        resources :symptom_diagnoses, as: :diagnoses
      end
      resources :diagnoses
      resources :bodies
      resources :causes
      resources :treats
      resources :diseases
    end

    namespace :admin, defaults: { namespace: 'admin' } do
      resources :members, only: [] do
        member do
          get :diseases
          get :search_diseases
          get 'disease' => :edit_disease
          patch 'disease' => :update_disease
        end
      end
    end

    namespace :my, defaults: { namespace: 'my' } do
      resources :profiles, only: [] do
        resources :profile_symptoms, as: :symptoms do
          collection do
            post :value
          end
        end
      end
    end

  end

end
