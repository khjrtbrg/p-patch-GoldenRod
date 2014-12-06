require 'rails_helper'

RSpec.describe ToolsController, :type => :controller do

  # can have context
  # before action user vs admin
  # try to have test with let!(:user)

  let(:user) { User.create( # creates a functional variable 'user'
    user_name: "kristen",
    email: "k@m.com",
    password: "hello",
    password_confirmation: "hello"
  )}

  let(:admin) { User.create( # creates a functional variable 'user'
    user_name: "kristen",
    email: "k@m.com",
    password: "hello",
    password_confirmation: "hello",
    admin: true
  )}

  describe "GET #index" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do

    # do this, and separate out into admin & user context
    # before(:each) do
    #   session[:user_id] = user.id
    # end

    it "is successful for admin user" do
      get :new, nil, user_id: admin.id
      expect(response.status).to eq 200
    end

    it "renders the :new template for admin user" do
      get :new, nil, user_id: admin.id
      expect(response).to render_template(:new)
    end

    it "redirects if guest user" do
      get :new
      expect(response).to redirect_to(tools_path)
    end

    it "redirects if logged in user is not admin" do
      get :new, nil, user_id: user.id
      expect(response).to redirect_to(tools_path)
    end
  end

  describe "POST #create" do

    let(:tool_params) { { "tool"=> {
      name: "Best tool ever",
      image_url: "http://www.tool.com/tool.jpg",
        }
      }
    }

    it "is successful for admin" do
      post :create, tool_params, user_id: admin.id
      expect(response).to redirect_to(tools_path)
    end

    it "creates tool for admin" do
      expect {
        post :create,
        tool_params,
        user_id: admin.id
      }.to change(Tool, :count).by(1)
    end

    it "is unsuccessful for logged in, non-admin user" do
      post :create, tool_params, user_id: user.id
      expect(response).to redirect_to(tools_path)
    end

    it "does not create tool for logged in, non-admin user" do
      expect {
        post :create,
        tool_params,
        user_id: user.id
      }.to change(Tool, :count).by(0)
    end

    it "is unsuccessful for guest user" do
      post :create, tool_params
      expect(response).to redirect_to(tools_path)
    end

    it "does not create tool for guest user" do
      expect {
        post :create,
        tool_params
      }.to change(Tool, :count).by(0)
    end

    it "renders :new if validation fails" do
     post :create, { tool: { name: nil, image_url: nil } }, user_id: admin.id
     expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    it "redirects to :index" do
      get :show, { id: 15 }
      expect(response).to redirect_to(tools_path)
    end
  end

  describe "PATCH #update" do

    let(:tool) { Tool.create(
      name: "Shovel",
      image_url: "http://www.tool.com/tool.jpg"
      )
    }

    before(:each) do
      session[:user_id] = user.id
    end

    it "is successful" do
      patch :update, { id: tool.id }
      expect(response).to redirect_to(tools_path)
    end

    it "updates a tool object" do
      patch :update, { id: tool.id }
      tool.reload
      expect(tool.user_id).to eq user.id
    end
  end
end
