class RemoveEmailFromRunners < ActiveRecord::Migration[5.2]
  def change
    remove_column :runners, :email, :string
  end
end
