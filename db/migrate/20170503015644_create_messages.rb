class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :message
      t.integer :from_user_id
      t.integer :to_user_id

      t.timestamps
    end
  end
end
