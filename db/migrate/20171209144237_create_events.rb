class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events, id: :uuid do |t|
      t.string  :title,     null: false, limit: 40
      t.string  :description
      t.integer :locale_id, null: false, default: 0
      t.integer :calc_id,   null: false,  default: 0

      t.timestamps
    end
    add_index :events, :id
  end
end
