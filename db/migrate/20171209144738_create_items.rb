class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items, id: :uuid do |t|
      t.uuid     :event_id,      null: false
      t.integer  :category_id,   null: false
      t.text     :memo
      t.datetime :registered_at, null: false
      t.integer  :tmp_amount,    null: false

      t.timestamps
    end
    add_index :items, :id
    add_index :items, :event_id
  end
end
