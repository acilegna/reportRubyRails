class TasksController < ApplicationController
  
   
   def import
    file = params[:file]
    return redirect_to users_path, notice: 'Only CSV please' unless file.content_type == 'text/csv'

    CsvImportUsersService.new.call(file)

    redirect_to users_path, notice: 'Users imported!'
  end

  

  def allTasks
      @task=  Task.order("likes DESC").limit(2)
   
    respond_to do |format|
      format.html
      format.csv do
        filename = ['Task', Date.today.to_s].join(' ')
        send_data User.to_csv(@task), filename:, content_type: 'text/csv'
      end
    end
  end

  
end
