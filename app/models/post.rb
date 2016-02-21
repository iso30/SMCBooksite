class Post < ActiveRecord::Base
	include PgSearch
	pg_search_scope :search_posts, :against => [:title,:body]
	belongs_to :user
	validates :title, presence: true
	validates :body, presence:true
end
