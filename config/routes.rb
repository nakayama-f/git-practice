Rails.application.routes.draw do

  get 'top7' => 'homes#top'
  resources :lists
 end