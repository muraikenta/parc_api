class AddFavoritesCountToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :favorites_count, :integer, default: 0
  end
end
