class ArticleAuthor < ActiveRecord::Base
  has_many :articles
end
