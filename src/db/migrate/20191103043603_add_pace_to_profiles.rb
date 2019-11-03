class AddPaceToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :pace, :string
  end
end
