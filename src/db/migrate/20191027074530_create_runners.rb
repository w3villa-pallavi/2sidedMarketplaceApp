class CreateRunners < ActiveRecord::Migration[5.2]
  def up
    create_table :runners do |t|
      t.string "username"
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.text "bio"
      t.timestamps
    end
  end
  def down
    drop_table :runners
  end
end
