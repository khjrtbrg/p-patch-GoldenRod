require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

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

    let!(:user) { create(:user) }

    let(:login_true) { {
      "email"=>"k@m.com",
      "password"=>"hello",
      }
    }

    let(:login_false) { {
      "email"=>"k@m.com",
      "password"=>"foo",
      }
    }

    it "denies non-existent user" do
      post :create, { email: "dino@dino.com", password: "hello" }
      expect(response).to render_template(:new)
    end

    it "denies invalid password" do
      user
      post :create, login_false
      expect(response).to render_template(:new)
    end

    it "accepts valid password" do
      user
      post :create, login_true
      expect(response).to redirect_to(root_path)
    end

    it "creates session" do
      user
      post :create, login_true
      expect(session[:user_id]).to eq user.id
    end

    it "returns a nil session" do
      user
      post :create, login_false
      expect(session[:user_id]).to eq nil
    end
  end

  describe "POST #destroy" do

    let!(:user) { create(:user) }

    before(:each) do
      session[:user_id] = user.id
    end

    it "clears session" do
      post :destroy
      expect(session[:user_id]).to eq nil
    end

    it "redirects to root_path" do
      post :destroy
      expect(response).to redirect_to(root_path)
    end
  end
end
