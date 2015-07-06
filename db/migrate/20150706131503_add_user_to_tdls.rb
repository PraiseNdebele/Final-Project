class AddUserToTdls < ActiveRecord::Migration
  def change
    add_reference :tdls, :user, index: true, foreign_key: true
    add_reference :tdls, :course, index: true, foreign_key: true
  end
end
