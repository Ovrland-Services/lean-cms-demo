Rails.application.routes.draw do
  # Health probe (load balancers / uptime monitors).
  get "up" => "rails/health#show", as: :rails_health_check

  # Public marketing pages — the demo site itself.
  root   "pages#home"
  get    "/about"   => "pages#about"
  get    "/trips"   => "pages#trips"
  get    "/contact" => "pages#contact"
end
