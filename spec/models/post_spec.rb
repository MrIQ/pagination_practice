require 'spec_helper'

describe Post do
  describe "@page_location_for" do
    it "should tell me which page is a post on" do
      new_post = FactoryGirl.create(:post, name: "latest")
      FactoryGirl.create(:post, name: "middle")
      old_post = FactoryGirl.create(:post, name: "older")
      WillPaginate.per_page = 2
      Post.page_location_for(old_post).should == 2
      Post.page_location_for(new_post).should == 1
    end
  end
end