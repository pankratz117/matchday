require 'rails_helper'

describe MatchdaysController do
  describe '#index' do
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
