require "rails_helper"

describe UsersController do

  before do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end

  describe "the Get routes" do
    describe "Get #index" do
    end

    describe "Get #show" do
    end

    describe "Get #edit" do
    end

    describe "Get #new" do
    end
  end

  describe "Post #create" do
    context "valid attributes" do
    end

    context "invalid attributes" do
    end
  end

  describe "Put #update" do
    context "valid attributes" do
    end

    context "invalid attributes" do
    end
  end

  describe "Delete #destroy" do
  end

end