class CreateHomes < ActiveRecord::Migration[4.2]
  def change
    create_table :homes do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
