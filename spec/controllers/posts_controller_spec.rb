require 'spec_helper'

describe PostsController do
  describe "GET #show" do
    it "should load the page" do
      get :index
      assigns[:posts].should_not be_nil
      response.should be_success
    end
  end
end
