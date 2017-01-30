class CreateElements < ActiveRecord::Migration[5.0]
  def change
    create_table :elements do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.date :date, null: false
      t.integer :days, null: false
      t.string :size, null: false
      t.string :zip_code, null: false
      t.string :image
      t.belongs_to :user

      t.timestamps
    end
  end
end
