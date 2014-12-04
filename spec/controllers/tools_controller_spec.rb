require 'rails_helper'

describe ToolsController do
  describe 'GET #index' do

    # renders the page
    # returns a successful http response
    # sets instance variable @available_tools
    # sets instance variable @unavailable_tools

    it 'is successful' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'populates an array of available tools' do
      tool1 = Tool.create(name: "hammer", status: "in")
      tool2 = Tool.create(name: "wheelbarrow", status: "in")
      controller.stub(:available_tools) {[tool1, tool2]}
      get :index
      expect(assigns(:available_tools)).to match_array [tool1, tool2]
    end

    it 'populates an array of unavailble tools' do
      tool1 = Tool.create(name: "shovel", status: "out")
      tool2 = Tool.create(name: "hoe", status: "out")
      controller.stub(:unavailable_tools) {[tool1, tool2]}
      get :index
      expect(assigns(:unavailable_tools)).to match_array [tool1, tool2]

    end

  end

end
