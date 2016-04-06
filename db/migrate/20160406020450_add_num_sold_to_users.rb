class AddNumSoldToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :num_sold, :integer
  end
end
