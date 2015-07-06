class CreateImportants < ActiveRecord::Migration
  def change
    create_table :importants do |t|
      t.datetime :date
      t.string :event
      t.text :remarks

      t.timestamps null: false
    end
  end
end
