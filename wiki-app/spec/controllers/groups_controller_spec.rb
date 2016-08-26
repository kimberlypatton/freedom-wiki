require 'rails_helper'


describe GroupsController do
  let(:member){User.create(first_name: "Kimberly", last_name: "Patton", email:"kim@kim.com", password_digest: "1234567")}
  let(:group){member.groups.create(name:"Name", description: "This is a group description.")}
  let(:group2){Group.new(description: "This is a group description.")}

  describe "GET #index" do
     it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end
    it "assigns @groups all created groups" do
      get :index
      expect(assigns(Group.all)).to eq(@groups)
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

      it "assigns the correct group as @group" do
        get :show, { id: group.id }
        expect(assigns(:group)).to eq(group)
      end

      it "renders the :show template" do
        get :show, { id: group.id }
        expect(response).to render_template(:show)
      end
    end

    describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end
    it "assigns a new group to @group" do
      get :new
      expect(assigns(:group)).to be_a_new Group
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do

      it "responds with status code 302" do
        post :create, { group: { name: "Name", description: "This is a group description."}}
        expect(response).to have_http_status 302
      end

      it "creates a new group in the database" do
        expect { post(:create, { group: {name:"Name", description: "This is a group description."}}) }.to change(Group, :count).by(1)
      end
      it "assigns the newly created group as @group" do
        post :create, { group: { name:"Name", description: "This is a group description."}}

        expect(assigns(:group)).to eq Group.last
      end
    end
  end
binding.pry
    it "sets a notice that the group was created successfully" do
      post :create, { group: {name:"Name", description: "This is a group description."} }
      expect(flash[:notice]).to match /Group was created successfully/
    end

    it "redirects to the created group" do
      post :create, { group: { name:"Name", description: "This is a group description."} }
      expect(response).to redirect_to group_url(Group.last.id)
    end


  context "when invalid params are passed" do
    it "responds with status code 200" do
      post :create, { group: { name: 8} }
      expect(response).to have_http_status 200
    end

    it "does not create a new group in the database" do
      expect { post(:create, { group: { name: 8 } }) }.to change(Group, :count).by(0)
    end

    it "assigns the unsaved group as @group" do
      post :create,  { group: { name: "Name" } }

      expect(assigns(:group).name).to eq 'Name'
    end

    it "renders the :new template" do
      post :create, { group: { user_throw: 'pineapple'} }
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE #destroy" do
    let(:group3){Group.create(name:"Name", description: "This is a group description.")}
    it "responds with status code 302" do
      delete :destroy, { id: group.id }
      expect(response).to have_http_status 302
    end

    it "destroys the requested group" do
      expect { delete(:destroy, { id: group3.id }) }.to change(Group, :count).by(-1)
    end

    it "sets a notice that the group was destroyed" do
      delete :destroy, { id: group.id }
      expect(flash[:notice]).to match /Group was deleted successfully/
    end

    it "redirects to the groups list" do
      delete :destroy, { id: group.id }
      expect(response).to redirect_to groups_url
    end
  end
end

