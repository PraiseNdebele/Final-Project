class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.datetime :date
      t.text :details
      t.integer :projected_mark
      t.integer :actual_mark
      t.integer :deviation

      t.timestamps null: false
    end
  end
end
