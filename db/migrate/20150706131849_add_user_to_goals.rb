class AddUserToGoals < ActiveRecord::Migration
  def change
    add_reference :goals, :user, index: true, foreign_key: true
    add_reference :goals, :course, index: true, foreign_key: true
  end
end
