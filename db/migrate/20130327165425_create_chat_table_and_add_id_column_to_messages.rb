class CreateChatTableAndAddIdColumnToMessages < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.column :name, :string

      t.timestamps
    end

    add_column :messages, :room_id, :int
  end
end
