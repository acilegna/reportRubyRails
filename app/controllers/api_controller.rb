 
class ApiController < ApplicationController


  def reportes(table,name)
    require 'csv' 
    $user=ENV['USERNAME']
    file = "C:/Users/#{$user}/Downloads/reporte-#{name}.csv"    
    headers = ["Id Tarea", "Title", "Description", "Location", "Status"]
    CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
      table.each do |task| 
        writer << [task.id, task.title, task.description, task.location,task.status]       
        
      end    
       writer <<  [ "\n" ]  
       writer << ["totalTareas",   table.count]
    end
  end  
 

 
  

  #def totalTask
   # @tasks=  Task.count
    # render json: ["Tareas creadas", @tasks]    
  #end


  def popularTask()
      table = Task.order("likes DESC").limit(2)
      name = 'popular';
      reportes(table,name)
  end

  def finishTask()
      table = Task.where(status: ["Pendiente","Terminado"]); 
      name = 'finish';
      reportes(table, name)
  end

end
