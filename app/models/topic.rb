class Topic < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 40}}
  validates :content, {presence: true, length: {maximum: 180}}

  belongs_to :user
  has_many :comments
end
