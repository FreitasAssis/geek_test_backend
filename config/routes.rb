Rails.application.routes.draw do
  resources :jobs
  resources :candidates
  get "/" => "jobs#index"
  get "/candidates_by_city/:id" => "jobs#find_candidates_by_city"
  get "/candidates_by_experience/:id" => "jobs#find_candidates_by_experience"
  get "/candidates_by_technologies/:id" => "jobs#find_candidates_by_technologies"
  get "/top5/:id" => "jobs#top5"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
