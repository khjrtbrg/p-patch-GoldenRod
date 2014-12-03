require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do

    let(:user_info) { { "user"=> {
      "user_name"=>"kristen",
      "email"=>"k@m.com",
      "password"=>"hello",
      "password_confirmation"=>"hello"
        }
      }
    }

    it "creates a User" do
      expect { post :create, user_info }.to change(User, :count).by(1)
    end

    it "redirects to root if successful" do
      post :create, user_info
      expect(response).to redirect_to(root_path)
    end

    it "renders an error if unsuccessful" do
      post :create, { "user"=> { user_name: "Kristen" } }
      expect(response).to render_template(:new)
    end

    it "sets session if successful" do
      post :create, user_info
      expect(session[:user_id]).to eq User.find_by(user_name: "kristen").id
    end
  end
end
