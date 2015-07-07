class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :document
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
