require "rails_helper"

describe UsersController do

  before do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end

  describe "the Get routes" do
    describe "Get #index" do
      it "renders the :index template"
    end

    describe "Get #show" do
      it "finds requested user"
      it "renders the :show template"
    end

    describe "Get #edit" do
      it "finds requested user"
      it "renders the :edit template"
    end

    describe "Get #new" do
      it "renders the :new template"
    end
  end

  describe "Post #create" do
    context "valid attributes" do
      it "saves new user"
      it "redirects to users#show"
    end

    context "invalid attributes" do
      it "does not save new user"
      it "redirects to users#new"
    end
  end

  describe "Put #update" do
    context "valid attributes" do
      it "updates the user"
      it "redirects to users#show"
    end

    context "invalid attributes" do
      it "does not update the user"
      it "redirects to users#edit"
    end
  end

  describe "Delete #destroy" do
    it "deletes the requested user"
    it "sets the session[:user_id] to nil"
    it "redirects to root_path"
  end

end