require "rails_helper"

describe UsersController do

  before do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end

  describe "the Get routes" do
    describe "Get #index" do
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "Get #show" do
      it "assigns requested user to @user" do
        get :show, id: @user
        expect(assigns(:user)).to eq @user
      end
      it "renders the :show template" do
        get :show, id: @user
        expect(response).to render_template :show
      end
    end

    describe "Get #edit" do
      it "assigns requested user to @user" do
        get :edit, id: @user
        expect(assigns(:user)).to eq @user
      end
      it "renders the :edit template" do
        get :edit, id: @user
        expect(response).to render_template :edit
      end
    end

    describe "Get #new" do
      it "assigns new User to @user" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe "Post #create" do
    context "valid attributes" do
      it "saves new user" do
        expect{ post :create, user: attributes_for(:contact)}.to change(User, :count).by(1)
      end
      it "redirects to users#show" do
        post :create, user: attributes_for(:contact)
        expect(response).to redirect_to root_path
      end
    end

    context "invalid attributes" do
      it "does not save new user" do
        expect{
          post :create, user: attributes_for(:invalid_user)
          }.to_not change(User, :count)
      end
      it "redirects to users#new" do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end

  describe "Put #update" do
    context "valid attributes" do
      it "locates requested user" do
        put :update, id: @user, user: attributes_for(:user)
        expect(assigns(:user)).to eq(@user)
      end
      it "updates the user's attributes" do
        put update, id: @user,
          user: attributes_for(:user,
            username: "valid_username")
        @user.reload
        expect(@user.username).to eq("valid_username")
      end
      it "redirects to users#show" do
        put :update, id: @user, user: attributes_for(:user)
        expect(response).to redirect_to @user
      end
    end

    context "invalid attributes" do
      it "does not update the user" do
        put :update, id: @user, user: attributes_for(:user,
            username: nil,
            email: "invalid_email@dbc.com")
        @user.reload
        expect(@user.username).to eq("test_username")
        expect(@user.email).to_not eq("invalid_email@dbc.com")
      end
      it "redirects to users#edit" do
        put :update, id: @user, user: atributes_for(invalid_contact)
        expect(response).to render_template :edit
      end
    end
  end

  describe "Delete #destroy" do
    it "deletes the requested user" do
      expect {
        delete :destroy, id: @user
      }.to change(User, :count).by(-1)
    end
    it "sets the session[:user_id] to nil" do
      delete :destroy, id: @user
      expect(session[:user_id]).to eq nil
    end
    it "redirects to root_path" do
      delete :destroy, id: @user
      expect(response).to redirect_to root_path
    end
  end

end