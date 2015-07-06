class CreateTdls < ActiveRecord::Migration
  def change
    create_table :tdls do |t|
      t.date :date
      t.text :task
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
