Rails.application.routes.draw do
   
 

   get "popular", to: "tasks#popular"
  
     get "tasks", to: "tasks#pendingFinish"
end

