class AddMoreToRecords < ActiveRecord::Migration
  def change
    add_column :records, :hour, :integer, default: 8
    add_column :records, :remark, :string
  end
end
