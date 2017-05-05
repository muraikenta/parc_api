class CreatePostsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :posts_tags do |t|
      t.references :post, index: true
      t.references :tag, index: true

      t.timestamps
    end

    add_index :posts_tags, [:post_id, :tag_id], unique: true
  end
end
