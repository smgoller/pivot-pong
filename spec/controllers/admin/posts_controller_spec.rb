require 'spec_helper'

describe Admin::PostsController do
  describe "#index" do
    before { get :index }
    it { response.should be_success }
    it { assigns(:posts).should == Post.all }
  end

  describe "#new" do
    before { get :new }
    it { response.should be_success }
    it { assigns(:post).should_not be_nil }
  end

  describe "#create" do
    it "should create a new post" do
      expect { get :create, post: {title: "foo", body: "bar"} }.to change(Post, :count).by(1)
      response.should redirect_to admin_posts_path
    end
  end

  describe "#destroy" do
    it "should delete a post" do
      post = Post.create title: "foo", body: "bar"
      expect { get :destroy, id: post.id }.to change(Post, :count).by(-1)
      response.should redirect_to admin_posts_path
    end
  end

  describe "#edit" do
    it "should delete a post" do
      post = Post.create title: "foo", body: "bar"
      get :edit, id: post.id
      assigns[:post].should == post
    end
  end

  describe "#update" do
    it "should update a post" do
      post = Post.create title: "foo", body: "bar"
      get :update, id: post.id, post: {title: 'booyah!'}
      post.reload.title.should == "booyah!"
    end
  end
end