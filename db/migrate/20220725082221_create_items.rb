class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item,    null: false
      t.text    :explain, null: false
      t.integer :price,   null: false

      t.timestamps
    end
  end
end
