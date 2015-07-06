class AddDetailsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :firstname, :string
  	add_column :users, :lastname, :string
  	add_column :users, :graduation_year, :date
  	add_column :users, :institution, :string
  	add_column :users, :major, :string
  	add_column :users, :career_field, :string
  	add_column :users, :bio, :text
  	add_column :users, :phone, :integer  	
  end
end
