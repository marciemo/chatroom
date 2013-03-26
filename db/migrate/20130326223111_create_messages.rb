class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.column :text, :string

      t.timestamps
    end
  end
end
