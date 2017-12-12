class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members, id: :uuid do |t|
      t.uuid :event_id, null: false
      t.string :name,   null: false
      t.integer :order, null: false, default: 0

      t.timestamps
    end
    add_index :members, :id
    add_index :members, :event_id
  end
end
