class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :section_name
      t.references :user, null: false, foreign_key: true
      t.date :created_date

      t.timestamps
    end
    add_index :sections, :section_name, unique: true
  end
end
