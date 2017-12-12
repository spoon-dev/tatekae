class CreateCalcs < ActiveRecord::Migration[5.1]
  def change
    create_table :calcs do |t|
      t.integer :unit,      null: false
      t.integer :locale_id, null: false, default: 0

      t.timestamps
    end
  end
end
