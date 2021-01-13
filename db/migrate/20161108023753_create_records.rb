class CreateRecords < ActiveRecord::Migration[4.2]
  def change
    create_table :records do |t|
      t.references :user, index: true, foreign_key: true
      t.date :date
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
