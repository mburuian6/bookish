Rails.application.routes.draw do
  resources :pdfs do
    get :read_pdf

    collection do
      put :save_page
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pdfs#index"
end
