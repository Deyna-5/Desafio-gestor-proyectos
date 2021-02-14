Rails.application.routes.draw do
  get "projects", to: "projects#index"
  root "projects#index"

  get "projects/new", to: "projects#new"
  post "projects", to: "projects#create"

  get 'projects/:id/edit', to: 'projects#edit', as: 'projects_edit'
  patch 'projects/:id', to: 'projects#update', as: "project"

  get "projects/:id", to: "projects#show", as: "projects_show"
  delete "projects/:id", to: "projects#destroy", as: "projects_destroy"
end
