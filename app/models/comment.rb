class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_comments_counter_for(post)
    posts = where(post: post)
    post.comments_counter = posts.length
  end
end
