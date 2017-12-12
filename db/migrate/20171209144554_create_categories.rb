class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name,       null: false
      t.string :icon,       null: false
      t.string :color,      null: false
      t.integer :order,     null: false, default: 0
      t.integer :locale_id, null: false, default: 0

      t.timestamps
    end
  end
end
