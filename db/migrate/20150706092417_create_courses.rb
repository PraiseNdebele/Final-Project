class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.date :end_date
      t.boolean :public

      t.timestamps null: false
    end
  end
end
