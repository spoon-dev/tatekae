class CreateActPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :act_payments do |t|
      t.uuid :item_id,   null: false
      t.uuid :member_id, null: false

      t.timestamps
    end
    add_index :act_payments, :item_id
    add_index :act_payments, :member_id
  end
end
