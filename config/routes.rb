Rails.application.routes.draw do

#  devise_for :users
  devise_for :users, :path_names => { :sign_up => "registro",:sign_in => "login" }
  devise_scope :user do
    authenticated :user do
      get 'index' => "welcome#index"
      get 'login' => "welcome#login"
      get 'register' => "welcome#register"
      get 'categorias/index'
      get 'horarios/index'
      get 'asignaciones/index'
      get 'buses/index'
      get 'choferes/index'
      get 'empresas/index'
      get 'rutas/index'
      get 'welcome/index'
      root 'welcome#index', as: :authenticated_root
    end

    unauthenticated do

      get 'register' => "welcome#register"
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # root :to => "welcome#index"
  #root :to => 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
