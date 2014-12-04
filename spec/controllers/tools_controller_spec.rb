require 'rails_helper'

describe ToolsController do
  describe 'GET #index' do
    it 'is successful' do
      get :index
      expect(response.status).to eq 200
    end

  end

end
