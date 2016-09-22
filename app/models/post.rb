class Post < ApplicationRecord
	validates :title, presence: true, length: {minimum:5}
	validates :body, presence: true
	has_many :comments, dependent: :destroy #刪除文章連留言一併刪除
end
