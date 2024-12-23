 
class ApiController < ApplicationController


  def reportes(table)
    require 'csv'
    $user=ENV['USERNAME']
    file = "C:/Users/#{$user}/Downloads/data.csv"        
    CSV.open( file, 'w' ) do |writer|
      writer << table.first.attributes.map { |a,v| a }
      table.each do |s|
        writer << s.attributes.map { |a,v| v }
      end
    end
  end  
  
  def totalTask

    require 'csv' 
    $user=ENV['USERNAME']
    file = "C:/Users/#{$user}/Downloads/data.csv"    
    products = Task.order("likes DESC").limit(2)
    headers = ["Product ID", "Name", "Price", "Description"]
CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
  products.each do |product| 
  writer << [product.id, product.title, product.date, product.location] 
  end
end
  end


  def popularTask()
      table = Task.order("likes DESC").limit(2)
      reportes(table)
  end

  def finishTask()
      table = Task.select('title','responsible', 'status').where(status: ["Pendiente","Terminado"]); 
      reportes(table)
  end

end
