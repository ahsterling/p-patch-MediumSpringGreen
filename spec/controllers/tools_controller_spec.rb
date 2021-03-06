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

  describe 'PUT #update' do

    it 'redirects to tools_path when successful' do
      tool1 = Tool.create(name: "bucket", status: "in")
      put :update, id: tool1.id, status: "out"
      expect(response.status).to eq 302
    end

    context 'checkout out tool' do
      it 'changes status from in to out' do
        tool1 = Tool.create(name: "bucket", status: "in")
        put :update, id: tool1.id, status: "out"
        expect(Tool.find(tool1.id).status).to eq "out"
      end

      it 'sets the user_id to the logged_in users id' do
        tool = Tool.create(name: "bucket", status: "in")
        user = User.create
        session[:user_id] = user.id
        put :update, id: tool.id, status: "out"
        expect(Tool.find(tool.id).user_id).to eq User.find(user.id).id
      end
    end

    context 'return tool' do
      it 'changes status from out to in' do
        tool = Tool.create(name: "bucket", status: "out")
        put :update, id: tool.id, status: "in"
        expect(Tool.find(tool.id).status).to eq "in"
      end

      it 'sets the user_id to nil' do
        user = User.create
        tool = Tool.create(name: "budket", status: "out", user_id: user.id)
        session[:user_id] = user.id
        put :update, id: tool.id, status: "in"
        expect(Tool.find(tool.id).user_id).to eq nil
      end

    end
  end
end
