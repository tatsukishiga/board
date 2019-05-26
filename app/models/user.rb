class User < ApplicationRecord
  has_secure_password

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX ,message: "形式が間違っています" }

  has_many :topics, dependent: :destroy
  has_many :comments, dependent: :destroy

  def admin?
    admin_status == true
  end
end
