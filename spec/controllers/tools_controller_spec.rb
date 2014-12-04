require 'rails_helper'

describe ToolsController do
  describe 'GET #index' do
    it 'is successful' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'populates an array of available tools' do
      tool1 = Tool.create(kind: "hammer", status: "in")
      tool2 = Tool.create(kind: "wheelbarrow", status: "in")
      controller.stub(:available_tools) {[tool1, tool2]}
      get :index
      expect(assigns(:available_tools)).to match_array [tool1, tool2]
    end

    it 'populates an array of unavailble tools' do
      tool1 = Tool.create(kind: "shovel", status: "out")
      tool2 = Tool.create(kind: "hoe", status: "out")
      controller.stub(:unavailable_tools) {[tool1, tool2]}
      get :index
      expect(assigns(:unavailable_tools)).to match_array [tool1, tool2]

    end

  end

end
