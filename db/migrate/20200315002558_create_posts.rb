class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :section, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :message
      t.date :date_created
      t.time :time_created
      t.bigint :likes
      t.bigint :dislikes
      t.boolean :locked

      t.timestamps
    end
  end
end
