class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username
      t.integer :age
      t.string :gender
      t.references :runner, foreign_key: true
      t.timestamps
    end
  end
end
