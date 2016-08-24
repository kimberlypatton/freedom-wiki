require 'rails_helper'

describe GroupsController do
  let(:group){Group.new(name:"Name", description: "This is a group description.")}
  let(:group2){Group.new(description: "This is a group description.")}

  describe "GET #index" do
     it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

    describe "GET #show" do
      it "responds with status code 200" do
        get :show, { id: group.id }
        expect(response).to have_http_status 200
      end

      it "assigns the correct game as @group" do
        get :show, { id: group.id }
        expect(assigns(:group)).to eq(group)
      end

      it "renders the :show template" do
        get :show, { id: group.id }
        expect(response).to render_template(:show)
      end
    end
end
