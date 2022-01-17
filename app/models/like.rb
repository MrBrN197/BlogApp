class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_likes_for(post)
    likes = where(post: post)
    puts likes.length
    post.likes_counter = likes.length
  end
end
