class AddMoreToRecords < ActiveRecord::Migration[4.2]
  def change
    add_column :records, :hour, :integer, default: 8
    add_column :records, :remark, :string
  end
end
