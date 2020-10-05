class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :owner
      t.bigint :balance, default: 0
      t.timestamps
    end
  end
end
