Rails.application.routes.draw do
  resources:articles
  resources:authors
  resources:tags
  root "articles#index"
end
