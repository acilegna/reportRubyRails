class TasksController < ApplicationController
  
   
   

 

  
def index
   @tasks=  Task.order("likes DESC").limit(2)
   
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="all_task.xlsx"'
      }
    end
  end

  
  


  
end
