require 'rails_helper'

describe 'matchdays routes' do
  it 'should route to matchdays index' do
    expect(get '/matchdays').to route_to('matchdays#index')
  end
end
