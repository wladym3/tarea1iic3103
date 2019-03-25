class PeopleController < ApplicationController
  def show

      p = params[:id]
      string = "https://swapi.co/api/people/"+p.to_s
      response_people = HTTParty.get(string)

      @people = Hash.new( "people" )

      @people = {
      "name" => response_people["name"],
      "height"=>response_people["height"],
      "mass"=>response_people["mass"],
      "hair_color"=>response_people["hair_color"],
      "skin_color"=>response_people["skin_color"],
      "eye_color" => response_people["eye_color"],
      "birth_year" => response_people["birth_year"],
      "gender" => response_people["gender"]

      }
      @species  = HTTParty.get(response_people["species"][0])["name"]

        @homeworld= Hash.new( "homeworld" )
        uri = "https://tarea1iic3103.herokuapp.com/" + response_people["homeworld"].slice(21,response_people["homeworld"].length)
       @homeworld= {"name" =>  HTTParty.get(response_people["homeworld"])["name"] ,"uri"=> uri}





       @films =[]
       i=0
      while i<response_people["films"].length do
        c= Hash.new( "peliculas" )
        uri = "https://tarea1iic3103.herokuapp.com/" + response_people["films"][i].slice(21,response_people["films"][i].length)
         c= {"title" =>  HTTParty.get(response_people["films"][i])["title"] ,"uri"=> uri}
        @films[i]= c
            i=i+1
      end

      @vehicles  =[]
        i=0
     while i<response_people["vehicles"].length do
       @vehicles[i]=  HTTParty.get(response_people["vehicles"][i])["name"]
       i=i+1
     end

     @starships  =[]
       i=0
    while i<response_people["starships"].length do
      c= Hash.new( "starships" )
      uri = "https://tarea1iic3103.herokuapp.com/" + response_people["starships"][i].slice(21,response_people["starships"][i].length)
       c= {"name" =>  HTTParty.get(response_people["starships"][i])["name"] ,"uri"=> uri}
      @starships[i]= c
      i=i+1
    end


  end
  end
