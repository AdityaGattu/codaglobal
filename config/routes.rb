Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :trains
  post "trains/search",to: "trains#search"

  resources :bookings

  post "bookings/cancel",to: "bookings#cancel"
end
