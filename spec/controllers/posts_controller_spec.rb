require 'spec_helper'

describe PostsController do
  describe "#create" do
    describe "success" do
      before(:each) do
        @post = FactoryGirl.attributes_for(:post)
        post :create, :post => @post
      end

      it { should redirect_to(posts_path) }
    end

    describe "failure" do
      before(:each) do
        post :create, post: {content: "content"}
      end

      it {should render_template(:new)}
    end
  end
end
