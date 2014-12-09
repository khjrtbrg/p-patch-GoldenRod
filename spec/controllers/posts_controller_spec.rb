require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }

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

    context "if guest" do
      it "redirects" do
        get :new
        expect(response).to redirect_to(posts_path)
      end
    end

    context "if user" do
      before(:each) do
        session[:user_id] = user.id
      end

      it "redirects" do
        get :new
        expect(response).to redirect_to(posts_path)
      end
    end

    context "if admin" do
      before(:each) do
        session[:user_id] = admin.id
      end

      it "is successful" do
        get :new
        expect(response.status).to eq 200
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template(:new)
      end
    end
  end

  describe "POST #create" do

    let(:post_params) { { "post"=> {
      title: "Best post ever",
      content: "Best content ever",
        }
      }
    }

    context "if guest" do
      it "is unsuccessful" do
        post :create, post_params
        expect(response).to redirect_to(posts_path)
      end

      it "does not create post" do
        expect {
          post :create,
          post_params
        }.to change(Post, :count).by(0)
      end
    end

    context "if user" do
      before(:each) do
        session[:user_id] = user.id
      end

      it "is unsuccessful" do
        post :create, post_params
        expect(response).to redirect_to(posts_path)
      end

      it "does not create post" do
        expect {
          post :create,
          post_params
        }.to change(Post, :count).by(0)
      end
    end

    context "if admin" do
      before(:each) do
        session[:user_id] = admin.id
      end

      it "is successful" do
        post :create, post_params
        expect(response).to redirect_to(posts_path)
      end

      it "creates post" do
        expect {
          post :create,
          post_params
        }.to change(Post, :count).by(1)
      end

      it "renders :new if validation fails" do
        post :create, { post: { title: nil, content: nil } }
        expect(response).to render_template(:new)
      end
    end
  end
end
