Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "contacts#index"
  get "/create_contact", to: "contacts#create"

  get "/delete_contact", to: "contacts#delete"

  get "/view_contact", to: "contacts#show"

end
