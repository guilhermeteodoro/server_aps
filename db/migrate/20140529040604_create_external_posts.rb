class CreateExternalPosts < ActiveRecord::Migration
  def change
    create_table :external_posts do |t|
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
