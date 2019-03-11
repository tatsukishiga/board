class Topic < ApplicationRecord
  paginates_per 5

  validates :title, {presence: true, length: {maximum: 40}}
  validates :content, {presence: true, length: {maximum: 180}}

  belongs_to :user
  has_many :comments
end
