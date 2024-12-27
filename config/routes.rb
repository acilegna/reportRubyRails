Rails.application.routes.draw do
   
 

     get "popular", to: "tasks#popular"
  
     get "tasks", to: "tasks#pendingFinish"

     #resources :tasks, only: [:index]
     #root 'api#index'

     get "report", to: "api#finishTask"
     get "popularTask", to: "api#popularTask"
     get "totalTask", to: "api#totalTask"
     
end

