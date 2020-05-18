Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #  root: home <DONE>
  #  index for account
  #  show_search_result (collection)
  #  show_individual_treehouse (member)
  #  new_treehouse (form) + create
end
