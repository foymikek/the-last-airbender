require 'rails_helper'

describe SearchService do
  it 'exists' do
    @service = SearchService.new
    expect(@service).to be_an_instance_of(SearchService)
  end

  it 'retrieves reviews'do
    search =  "fire nation"
    respsonse = SearchService.retrieve_population_characters(search)

    expect(respsonse).to be_an(Array)
    expect(respsonse[0]).to be_a(Hash)

    expect(respsonse[0]).to have_key(:name)
    expect(response[:name]).to be_a(String)

    expect(respsonse[0]).to have_key(:photoUrl)
    expect(response[:photoUrl]).to be_a(String)

    expect(respsonse[0]).to have_key(:allies)
    expect(response[:allies]).to be_an(Array)
    expect(response[:allies][0]).to be_a(String)

    expect(respsonse[0]).to have_key(:enemies)
    expect(response[:enemies]).to be_an(Array)
    expect(response[:enemies][0]).to be_a(String)

    expect(respsonse[0]).to have_key(:affiliation)
    expect(response[:affiliation][0]).to be_a(String)
  end
end