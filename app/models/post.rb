class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments

  def self.update_post_count_for(user)
    posts = where(author: user)
    user.posts_counter = posts.length
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
