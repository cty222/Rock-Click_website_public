class CreateArticleAuthors < ActiveRecord::Migration
  def change
    create_table :article_authors do |t|
      t.string :name, null: false
      t.string :cover
      t.text :description
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
