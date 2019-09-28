class Topic < ApplicationRecord
  is_impressionable :counter_cache => true

  paginates_per 5

  validates :title, {presence: true, length: {maximum: 40}}
  validates :content, {presence: true, length: {maximum: 180}}

  belongs_to :user
  has_many :comments

  def self.search(title)
    where('title LIKE ?', "%#{title}%")
  end
end
