 
class ApiController < ApplicationController

  def index
    require 'csv'
    $user=ENV['USERNAME']
    file = "C:/Users/#{$user}/Downloads/data.csv"
    table = Task.where(status: ["Pendiente","Terminado"]);
    
    CSV.open( file, 'w' ) do |writer|
      writer << table.first.attributes.map { |a,v| a }
      table.each do |s|
        writer << s.attributes.map { |a,v| v }
      end
    end
  end
  
end
