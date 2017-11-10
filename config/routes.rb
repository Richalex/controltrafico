Rails.application.routes.draw do

  devise_for :users
  root to: "welcome#index"
  get 'categorias/index'

  get 'horarios/index'

  get 'asignaciones/index'

  get 'buses/index'

  get 'choferes/index'

  get 'empresas/index'

  get 'rutas/index'

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
