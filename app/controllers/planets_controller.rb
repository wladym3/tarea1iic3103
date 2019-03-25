class PlanetsController < ApplicationController
  def show

      p = params[:id]
      string = "https://swapi.co/api/planets/"+p.to_s
      response_planets = HTTParty.get(string)

      @planets = Hash.new( "planets" )
      @planets = { "name" => response_planets["name"],
"rotation_period"=>response_planets["rotation_period"],
"orbital_period"=>response_planets["orbital_period"],
"diameter"=>response_planets["diameter"],
"climate"=>response_planets["climate"],
"gravity" => response_planets["gravity"],
"terrain" => response_planets["terrain"],
"surface_water" => response_planets["surface_water"],
"population" => response_planets["population"]
}


      @films =[]
      i=0
     while i<response_planets["films"].length do
       c= Hash.new( "peliculas" )
       uri = "https://tarea1iic3103.herokuapp.com/" + response_planets["films"][i].slice(21,response_planets["films"][i].length)
        c= {"title" =>  HTTParty.get(response_planets["films"][i])["title"] ,"uri"=> uri}
       @films[i]= c
           i=i+1
     end

      @residents  =[]
        i=0
     while i<response_planets["residents"].length do
       c= Hash.new( "residents" )
       uri = "https://tarea1iic3103.herokuapp.com/" + response_planets["residents"][i].slice(21,response_planets["residents"][i].length)
        c= {"name" =>  HTTParty.get(response_planets["residents"][i])["name"] ,"uri"=> uri}
       @residents[i]= c
       i=i+1
     end





  end
  end
