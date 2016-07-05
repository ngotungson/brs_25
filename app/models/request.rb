class Request < ActiveRecord::Base
  belongs_to :user

  validates :book_title, presence: true, length: {maximum: 50}
  validates :book_author, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 50}
end
