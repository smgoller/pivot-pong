require 'spec_helper'

describe Post do
  subject { Post.create(title: "My title", body: "My body") }
  its(:title) { should == "My title" }
  its(:body) { should == "My body" }
end