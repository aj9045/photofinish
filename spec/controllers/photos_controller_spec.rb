require "rails_helper"

describe PhotosController do

  before do
    @user = create(:user)
    @photo = create(:photo, user_id: @user.id)
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
      it "assigns requested photo to @photo" do
        get :show, id: @photo
        expect(assigns(:photo)).to eq @photo
      end
      it "renders the :show template" do
        get :show, id: @photo
        expect(response).to render_template :show
      end
    end

    describe "Get #edit" do
      it "assigns requested photo to @photo" do
        get :edit, id: @photo
        expect(assigns(:photo)).to eq @photo
      end
      it "renders the :edit template" do
        get :edit, id: @photo
        expect(response).to render_template :edit
      end
    end

    describe "Get #new" do
      it "assigns new Photo to @photo" do
        get :new
        expect(assigns(:photo)).to be_a_new(Photo)
      end
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe "Post #create" do
    context "valid attributes" do
      it "saves new photo" do
        expect{ post :create, photo: attributes_for(:photo, user_id: @user.id)}.to change(Photo, :count).by(1)
      end
      it "redirects to new photo" do
        post :create, photo: attributes_for(:photo, user_id: @user.id)
        expect(response).to redirect_to photo_path(assigns(:photo))
      end
    end

    context "invalid attributes" do
      it "does not save new photo" do
        expect{
          post :create, photo: attributes_for(:invalid_photo)
          }.to_not change(Photo, :count)
      end
      it "redirects to photos#new" do
        post :create, photo: attributes_for(:invalid_photo)
        expect(response).to render_template :new
      end
    end
  end

  describe "Put #update" do
    context "valid attributes" do
      it "locates requested photo" do
        put :update, id: @photo, photo: attributes_for(:photo)
        expect(assigns(:photo)).to eq(@photo)
      end
      it "updates the photo's attributes" do
        put :update, id: @photo,
          photo: attributes_for(:photo,
            title: "valid_title")
        @photo.reload
        expect(@photo.title).to eq("valid_title")
      end
      it "redirects to photos#show" do
        put :update, id: @photo, photo: attributes_for(:photo)
        expect(response).to redirect_to @photo
      end
    end

    context "invalid attributes" do
      it "does not update the photo" do
        put :update, id: @photo, photo: attributes_for(:photo,
            title: nil)
        @photo.reload
        expect(@photo.title).to eq("test_title")
      end
      it "redirects to photos#edit" do
        put :update, id: @photo, photo: attributes_for(:invalid_photo)
        expect(response).to render_template :edit
      end
    end
  end

  describe "Delete #destroy" do
    it "should locate the requested photo" do
      delete :destroy, id: @photo
      expect(assigns[:photo]).to eq(@photo)
    end
    it "deletes the requested photo" do
      expect {
        delete :destroy, id: @photo
      }.to change(Photo, :count).by(-1)
    end
    it "redirects to root_path" do
      delete :destroy, id: @photo
      expect(response).to redirect_to root_path
    end
  end

end