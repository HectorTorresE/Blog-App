class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  validates :text, presence: true
  after_save :plus_counter
  after_destroy :minus_counter

  def plus_counter
    post.increment!(:commentscounter)
  end

  def minus_counter
    post.decrement!(:commentscounter)
  end
end
