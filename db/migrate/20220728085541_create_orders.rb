class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :item,    null: false, foreign_key: true
      t.text       :request, null: false
      t.integer    :pay_id,  null: false
      
      t.timestamps
    end
  end
end