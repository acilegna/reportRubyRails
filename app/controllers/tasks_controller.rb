class TasksController < ApplicationController 

 

 

  
def popular
   @tasks=  Task.order("likes DESC").limit(2)
    @total= Task.count

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="popular.xlsx"'
      }
    end
  end

    def pendingFinish
 
   @tasks= Task.where(status: ["Pendiente","Terminado"])

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="tasks.xlsx"'
      }
    end
  end


  
end
