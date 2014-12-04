require 'rails_helper'

describe PostsController do

  describe 'GET #index' do
    it 'is successful' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'populates an array of posts' do
      post = Post.create()
      controller.stub(:posts) {[post]}
      get :index
      expect(assigns(:posts)).to match_array [post]
    end
  end

  describe 'GET #show' do
    it 'is successful' do
      post = Post.create(title: "Test_title", content: "here's the content")
      get :show, id: post.id
      expect(response.status).to eq 200
    end

    it 'renders the show view' do
      post = Post.create(title: "Test_title", content: "here's the content")
      get :show, id: post.id
      expect(response).to render_template :show
    end

  end

end
