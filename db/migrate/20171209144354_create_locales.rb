class CreateLocales < ActiveRecord::Migration[5.1]
  def change
    create_table :locales do |t|
      t.string :code, null: false, limit: 2

      t.timestamps
    end
  end
end
