class TasksController < ApplicationController
  def shows1
    @task=  Task.order("likes DESC").limit(2)
    render json: @task
  end

  def shows2
     @task= Task.count
    
   #render json: @task
  end

   def allTasks
      @task= Task.where(status: ["Pendiente","Terminado"])

      
  respond_to do |format|
    format.xlsx {
      response.headers[
        'Content-Disposition'
      ] = "attachment; filename='all.xlsx'"
    }
    format.html { render :allTasks }
  end
  end

  
end
