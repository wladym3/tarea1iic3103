class FilmsController < ApplicationController

def show

    p = params[:id]
    string = "https://swapi.co/api/films/"+p.to_s
    response_films = HTTParty.get(string)

    @pelicula = Hash.new( "episodio" )



    @pelicula = { "title" => response_films["title"], "release_date"=>response_films["release_date"],"director"=>response_films["director"],"producer"=>response_films["producer"],"episode_id"=>response_films["episode_id"], "opening_crawl" => response_films["opening_crawl"]}
    i=0
     @characters  =[]

    while i<response_films["characters"].length do
      c= Hash.new( "personajes" )
      uri = "http://localhost:3000/" + response_films["characters"][i].slice(21,response_films["characters"][i].length)
       c= {"name" => HTTParty.get(response_films["characters"][i])["name"] ,"uri"=> uri}
      @characters[i]=c
      i=i+1
    end
    @planets  =[]
      i=0
   while i<response_films["planets"].length do
     c= Hash.new( "planetas" )
     uri = "http://localhost:3000/" + response_films["planets"][i].slice(21,response_films["planets"][i].length)
      c= {"name" =>  HTTParty.get(response_films["planets"][i])["name"] ,"uri"=> uri}

     @planets[i]= c
     i=i+1
   end

   @starships  =[]
     i=0
  while i<response_films["starships"].length do
    c= Hash.new( "naves" )
    uri = "http://localhost:3000/" + response_films["starships"][i].slice(21,response_films["starships"][i].length)
     c= {"name" =>  HTTParty.get(response_films["starships"][i])["name"] ,"uri"=> uri}

    @starships[i]=  c
    i=i+1
  end

end
end
