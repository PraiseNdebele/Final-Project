class ChangeDataTypeForTableColumn < ActiveRecord::Migration
  def change
	change_table :users do |t|  
  		t.change :phone, :string 
	end
  end
end
