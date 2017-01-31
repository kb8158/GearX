class CreateNewItemsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :new_items_tables do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.string :image, null: false
      t.string :size, null: false
      t.string :image, null: false
      t.boolean :selected, default: false
      t.integer :lender_id, null: false
      t.integer :borrower_id

      t.timestamps null: false
    end
  end
end
