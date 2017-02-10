class CreateThings < ActiveRecord::Migration[5.0]
  def change
    create_table :things do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.integer :days
      t.date :date
      t.string :zip_code

      t.integer :searcher_id, null: false
      t.integer :finder_id

      t.timestamps
    end
  end
end
