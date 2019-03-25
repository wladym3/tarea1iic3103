
  class WelcomeController < ApplicationController

  def index
  response = HTTParty.get("https://swapi.co/api/films")
  count = response["count"].to_f
  @count = count
  i=1
  @StarW=[]
    while i<count+1 do
      string = "https://swapi.co/api/films/"+i.to_s
      response_films = HTTParty.get(string)
      pelicula = Hash.new( "episodio" )
      pelicula = { "title" => response_films["title"], "release_date"=>response_films["release_date"],"director"=>response_films["director"],"producer"=>response_films["producer"],"episode_id"=>response_films["episode_id"]}
      @StarW[i-1]=pelicula;
      i=i+1
    end
  end
end
