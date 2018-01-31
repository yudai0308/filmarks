class AddSubnameToAwards < ActiveRecord::Migration[5.0]
  def change
    add_column :awards, :subname, :string, null:false
  end
end
