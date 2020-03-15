class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.date :birth_date
      t.string :nivel_respueston
      t.string :nivel_publicon

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
