class ChangeTableColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :age, :string
  end
end
