class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :message
      t.integer :user_id
      t.integer :target_user_id

      t.timestamps
    end

    add_index :messages, [:user_id, :target_user_id]
  end
end
