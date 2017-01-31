class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.string :image
      t.string :size, null: false
      t.string :zip_code, null: false

      t.integer :lender_id, null: false
      t.integer :borrower_id

      t.timestamps
    end
  end
end
