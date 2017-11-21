Rails.application.routes.draw do

#  devise_for :users
  devise_for :users, :path_names => { :sign_up => "registro",:sign_in => "login" }
  devise_scope :user do
    authenticated :user do
      get 'index' => "welcome#index"
      get 'login' => "welcome#login"
      get 'register' => "welcome#register"
      get 'asignaciones/index'

      #CRUD Horarios
      # Index
      get 'horarios' , to: 'horarios#index',as: 'horarios'
      # Editar
      get 'horarios/:id/editar', to: 'horarios#editar', as: 'editar_horario'
      put 'horarios/:id', to: 'horarios#update'
      patch 'horarios/:id', to: 'horarios#update'

      # Nuevo
      post 'horarios', to: 'horarios#crear'
      get 'horarios/nuevo' , to: 'horarios#nuevo', as: 'nuevo_horario'
      # Mostrar
      get 'horarios/:id', to: 'horarios#mostrar', as: 'horario'
      # Eliminar
      delete 'horarios.:id' , to: 'horarios#eliminar'


      #CRUD Categorias
      # Index
      get 'categorias' , to: 'categorias#index',as: 'categorias'
      # Editar
      get 'categorias/:id/editar', to: 'categorias#editar', as: 'editar_categoria'
      put 'categorias/:id', to: 'categorias#update'
      patch 'categorias/:id', to: 'categorias#update', as:'update_categoria',action: :update

      # Nuevo
      post 'categorias', to: 'categorias#crear'
      get 'categorias/nuevo' , to: 'categorias#nuevo', as: 'nueva_categoria'
      # Mostrar
      get 'categorias/:id', to: 'categorias#mostrar', as: 'categoria'
      # Eliminar
      delete 'categorias.:id' , to: 'categorias#eliminar'

      #CRUD Buses
      # Index
      get 'buses' , to: 'buses#index',as: 'buses'
      # Editar
      get 'buses/:id/editar', to: 'buses#editar', as: 'editar_bus'
      put 'buses/:id', to: 'buses#update'
      patch 'buses/:id', to: 'buses#update'

      # Nuevo
      post 'buses', to: 'buses#crear'
      get 'buses/nuevo' , to: 'buses#nuevo', as: 'nuevo_bus'
      # Mostrar
      get 'buses/:id', to: 'buses#mostrar', as: 'bus'
      # Eliminar
      delete 'buses.:id' , to: 'buses#eliminar'

          #CRUD choferes
      # Index
      get 'choferes/' , to: 'choferes#index', as: 'choferes'
      # Editar
      get 'choferes/:id/editar', to: 'choferes#editar', as: 'editar_chofer'
      put 'choferes/:id', to: 'choferes#update', action: :update
      patch 'choferes/:id', to: 'choferes#update', as:'update_chofer',action: :update
      # Nuevo
      get 'choferes/nuevo' , to: 'choferes#nuevo', as: 'nuevo_chofer'
      post 'choferes/', to: 'choferes#crear', as: 'crear_chofer'
      # Mostrar
      get 'choferes/:id', to: 'choferes#mostrar', as: 'chofer'
      # Eliminar
      delete 'choferes.:id' , to: 'choferes#eliminar'

          #CRUD empresas
          # Index
      get 'empresas' , to: 'empresas#index',as: 'empresas'
          # Editar
      get 'empresas/:id/editar', to: 'empresas#editar', as: 'editar_empresa'
      put 'empresas/:id', to: 'empresas#update'
      patch 'empresas/:id', to: 'empresas#update'

          # Nuevo
      post 'empresas', to: 'empresas#crear'
      get 'empresas/nuevo' , to: 'empresas#nuevo', as: 'nueva_empresa'
          # Mostrar
      get 'empresas/:id', to: 'empresas#mostrar', as: 'empresa'
          # Eliminar
      delete 'empresas.:id' , to: 'empresas#eliminar'

      #CRUD Rutas
      # Index
      get 'rutas' , to: 'rutas#index',as: 'rutas'
      # Editar
      get 'rutas/:id/editar', to: 'rutas#editar', as: 'editar_ruta'
      put 'rutas/:id', to: 'rutas#update'
      patch 'rutas/:id', to: 'rutas#update', as:'update_ruta',action: :update

      # Nuevo
      post 'rutas', to: 'rutas#crear'
      get 'rutas/nuevo' , to: 'rutas#nuevo', as: 'nueva_ruta'
      # Mostrar
      get 'rutas/:id', to: 'rutas#mostrar', as: 'ruta'
      # Eliminar
      delete 'rutas.:id' , to: 'rutas#eliminar'

      get 'welcome/index'
      root 'welcome#index', as: :authenticated_root
      match '*path' => redirect('/'), via: [:get, :post]
    end

    unauthenticated do

      get 'register' => "welcome#register"
      root 'devise/sessions#new', as: :unauthenticated_root
      match '*path' => redirect('/'), via: [:get, :post]
    end
  end
  # root :to => "welcome#index"
  #root :to => 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
