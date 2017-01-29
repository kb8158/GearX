class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.string :image

      t.belongs_to :user
    end
  end
end
