class Post < ActiveRecord::Base
  attr_accessible :content, :name
  validates :name, presence: true, uniqueness: true

  def self.page_location_for(post)
    post_index = Post.order(:created_at).to_a.index(post)
    posts_per_page = WillPaginate.per_page
    ((post_index*1.0+1)/posts_per_page).ceil
  end
end
