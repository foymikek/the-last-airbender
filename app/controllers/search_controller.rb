class SearchController < ApplicationController
  def index
    param = params[:nation]
    param = param.gsub("_", " ")
    connection = Faraday.new("https://last-airbender-api.herokuapp.com")
    response = connection.get("/api/v1/characters?affiliation=#{param}")
    results = JSON.parse(response.body, symbolize_names: true)
  end
end
