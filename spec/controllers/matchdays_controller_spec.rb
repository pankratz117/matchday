require 'rails_helper'

describe MatchdaysController do
  describe '#index' do
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper view' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
