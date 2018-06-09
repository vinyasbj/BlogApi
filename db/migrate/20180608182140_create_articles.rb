class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
    t.string :title
      t.integer :category_id
      t.text :body

      t.timestamps
    end
  end
end
