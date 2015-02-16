require "rails_helper"

describe SessionController do
  describe "Get#new" do
    it "renders login" do
      get :new
      expect(response).to render_template(:login)
    end
  end

   describe "Post#login" do
    before do
      @user = create(:user)
      session[:user_id] = @user.id
    end
    it "should set session with user id" do
      post :login, user: @user.attributes
      puts session[:user_id]
      expect(session[:user_id]).to eq(@user.id)
    end
    it "should redirect to root_path" do
      post :login, user: @user.attributes
      expect(response).to redirect_to root_path
    end
  end

  describe "Delete#logout" do
    it "sets session[:user_id] back to nil" do
      delete :logout
      expect(session[:user_id]).to eq nil
    end
  end
end