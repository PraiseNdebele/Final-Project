class AddUserToImportants < ActiveRecord::Migration
  def change
    add_reference :importants, :user, index: true, foreign_key: true
    add_reference :importants, :course, index: true, foreign_key: true
  end
end
