class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.references :post, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date_created
      t.time :time_created
      t.text :message

      t.timestamps
    end
  end
end
