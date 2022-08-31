class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments
  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, :likescounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  after_create :plus_post
  after_destroy :minus_post

  def plus_post
    author.increment!(:postscounter)
  end

  def minus_post
    author.decrement!(:postscounter)
  end

  def five_recent_comments
    comments.where(post: self).order(created_at: :desc).limit(5)
  end

  def liked?(user)
    likes.where(author: user).any?
  end
end
