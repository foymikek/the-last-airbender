class SearchController < ApplicationController
  def index
    param = params[:nation]
    param = param.gsub("_", " ")
    connection = Faraday.new("https://last-airbender-api.herokuapp.com")
    response = connection.get("/api/v1/characters?affiliation=#{param}&perPage=100&page=1")
    results = JSON.parse(response.body, symbolize_names: true)
    @characters = results.map do |result|
      Character.new(result)
    end
    # require 'pry'; binding.pry
  end
end
