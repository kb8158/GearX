class CreateExchanges < ActiveRecord::Migration[5.0]
  def change
    create_table :exchanges do |t|
      t.belongs_to :user
      t.belongs_to :item
      t.boolean :selected
    end
  end
end
