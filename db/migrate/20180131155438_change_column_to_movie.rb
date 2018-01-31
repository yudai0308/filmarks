class ChangeColumnToMovie < ActiveRecord::Migration[5.0]
  def up
    change_column :movies, :time, :integer
    change_column :movies, :release, :date
  end

  def down
    change_column :movies, :time, :string
    change_column :movies, :release, :string
  end
end
