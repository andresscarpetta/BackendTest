Rails.application.routes.draw do

  root to: "home#index"
  get "image.jpg", as: "show", controller: "home", action: "show_results"

end
