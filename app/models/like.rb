class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_save :plus_counter
  after_destroy :minus_counter

  def plus_counter
    post.increment!(:likescounter)
  end
end
