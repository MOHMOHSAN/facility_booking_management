class UpdateRoomModel < ActiveRecord::Migration[5.2]
  def change
  	add_column :rooms, :capacities, :integer, :default => 3
  	add_index :rooms, :room_name
  	add_index :rooms, :floor
  	add_index :rooms, :room_type
  	add_index :rooms, :capacities

  end
end
