class StarshipsController < ApplicationController
  def show

      p = params[:id]
      string = "https://swapi.co/api/starships/"+p.to_s
      response_starships = HTTParty.get(string)

      @starships = Hash.new( "starships" )
      @starships = {"name" => response_starships["name"],"model"=>response_starships["model"],"manufacturer"=>response_starships["manufacturer"],"length"=>response_starships["length"],"max_atmosphering_speed"=>response_starships["max_atmosphering_speed"],"crew" => response_starships["crew"],"passengers" => response_starships["passengers"],"cargo_capacity" => response_starships["cargo_capacity"],"consumables" => response_starships["consumables"],"hyperdrive_rating"=>response_starships["hyperdrive_rating"],"MGLT" => response_starships["MGLT"],"starship_class" => response_starships["starship_class"]}



      @films =[]
      i=0
     while i<response_starships["films"].length do
       c= Hash.new( "peliculas" )
       uri = "http://localhost:3000/" + response_starships["films"][i].slice(21,response_starships["films"][i].length)
        c= {"title" =>  HTTParty.get(response_starships["films"][i])["title"] ,"uri"=> uri}
       @films[i]= c
           i=i+1
     end


     @pilots  =[]
       i=0
    while i<response_starships["pilots"].length do
      c= Hash.new( "pilots" )
      uri = "http://localhost:3000/" + response_starships["pilots"][i].slice(21,response_starships["pilots"][i].length)
       c= {"name" =>  HTTParty.get(response_starships["pilots"][i])["name"] ,"uri"=> uri}
      @pilots[i]= c
      i=i+1
    end


  end
  end
