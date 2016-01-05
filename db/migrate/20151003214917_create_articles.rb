class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false 
      t.text :content, null: false
      t.string :cover
      t.string :summary, null: false
      t.date :auto_post_date
      t.boolean :enable, default:false, null: false
      t.string :tag
      t.belongs_to :article_author, null: false
      t.timestamps null: false
    end
  end
end