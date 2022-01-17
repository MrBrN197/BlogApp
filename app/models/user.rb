class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def self.first_three
    limit(3)
  end
end
