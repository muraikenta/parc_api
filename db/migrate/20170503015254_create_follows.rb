class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :target_user_id

      t.timestamps
    end

    add_index :follows, [:user_id, :target_user_id]
  end
end
