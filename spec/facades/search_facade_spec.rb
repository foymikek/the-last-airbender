require 'rails_helper'

describe SearchFacade do
  it 'exists' do
    search_facade = SearchFacade.new

    expect(search_facade).to be_an_instance_of(SearchFacade)
  end

  it 'can search characters by population' do
    search =  "fire nation"
    search_facade = SearchFacade.by_population(search)

    expect(search_facade.count).to eq(97)
    expect(search_facade.first).to be_an_instance_of(Character)
  end
end