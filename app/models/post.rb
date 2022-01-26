class Post < ApplicationRecord
  validates :title, length: { maximum: 250 }, presence: true
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_post_count
  after_destroy :decrement_likes

  def decrement_likes
    author.decrement!(:posts_counter)
  end

  def update_post_count
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
