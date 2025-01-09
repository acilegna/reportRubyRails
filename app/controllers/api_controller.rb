
class ApiController < ApplicationController
  def reportes(table, name, total)
    require "csv"
    $user=ENV["USERNAME"]
    file = "C:/Users/#{$user}/Downloads/reporte-#{name}.csv"
    headers = [ "Id Tarea", "Title", "Description", "Location", "Status" ]
    CSV.open(file, "w", write_headers: true, headers: headers) do |writer|
      table.each do |task|
        writer << [ task.id, task.title, task.description, task.location, task.status ]
      end
       writer <<  [ "\n" ]
       writer << [ "Total_tareas_creadas",   total ]
    end
  end





def totalTask
    @tasks=  Task.count
  # render json: ["Tareas creadas", @tasks]
end


  def popularTask
      table = Task.order("likes DESC").limit(2)
      name = "popular"
      total = totalTask
      reportes(table, name, total)
  end

  def finishTask
      table = Task.where(status: [ "Pendiente", "Terminado" ])
      name = "finish"
      total = totalTask
      reportes(table, name, total)
  end
end
