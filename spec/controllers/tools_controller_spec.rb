require 'rails_helper'

RSpec.describe ToolsController, :type => :controller do

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
    it "is successful for admin user" do
      get :new, nil, user_id: admin.id
      expect(response.status).to eq 200
    end

    # it "renders the :new template for admin user" do
    #   get :new, nil, user_id: admin.id
    #   expect(response).to render_template(:new)
    # end
    #
    # it "redirects if user is not logged in" do
    #   get :new
    #   expect(response).to redirect_to(posts_path)
    # end
    #
    # it "redirects if logged in user is not admin" do
    #   get :new, nil, user_id: user.id
    #   expect(response).to redirect_to(posts_path)
    # end
  end
end
