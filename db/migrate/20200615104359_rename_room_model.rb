class RenameRoomModel < ActiveRecord::Migration[5.2]
  def change
  	rename_column :rooms, :name, :room_name
  	rename_column :rooms, :type, :room_type
  end
end
