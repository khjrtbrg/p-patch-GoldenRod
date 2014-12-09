require 'rails_helper'

RSpec.describe ToolsController, :type => :controller do

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

    context "if guest user" do
      it "redirects" do
        get :new
        expect(response).to redirect_to(tools_path)
      end
    end

    context "if logged in user" do
      before(:each) do
        session[:user_id] = user.id
      end

      it "redirects" do
        get :new
        expect(response).to redirect_to(tools_path)
      end
    end

    context "if admin user" do
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

    let(:tool_params) { { "tool"=> {
      name: "Best tool ever",
      image_url: "http://www.tool.com/tool.jpg",
        }
      }
    }

    context "if guest user" do
      it "is unsuccessful" do
        post :create, tool_params
        expect(response).to redirect_to(tools_path)
      end

      it "does not create tool" do
        expect {
          post :create,
          tool_params
        }.to change(Tool, :count).by(0)
      end
    end

    context "if logged in user" do
      before(:each) do
        session[:user_id] = user.id
      end

      it "is unsuccessful" do
        post :create, tool_params
        expect(response).to redirect_to(tools_path)
      end

      it "does not create tool" do
        expect {
          post :create,
          tool_params
        }.to change(Tool, :count).by(0)
      end
    end

    context "if admin user" do
      before(:each) do
        session[:user_id] = admin.id
      end

      it "is successful" do
        post :create, tool_params
        expect(response).to redirect_to(tools_path)
      end

      it "creates tool" do
        expect {
          post :create,
          tool_params
        }.to change(Tool, :count).by(1)
      end

      it "renders :new if validation fails" do
        post :create, { tool: { name: nil, image_url: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    it "redirects to :index" do
      get :show, { id: 15 }
      expect(response).to redirect_to(tools_path)
    end
  end

  describe "PATCH #update" do

    let(:tool) { create(:tool) }
    let(:borrowed_tool) { create(:borrowed_tool) }

    context "if guest" do
      it "is unsuccessful" do
        patch :update, { id: tool.id }
        expect(response).to render_template(:index)
      end
    end

    context "if logged in user" do
      before(:each) do
        session[:user_id] = user.id
      end

      context "if borrowing tool" do
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

      context "if returning tool" do
        it "is successful" do
          patch :update, { id: borrowed_tool.id }
          expect(response).to redirect_to(tools_path)
        end

        it "updates a tool object" do
          patch :update, { id: borrowed_tool.id }
          borrowed_tool.reload
          expect(borrowed_tool.user_id).to eq nil
        end
      end
    end
  end
end
