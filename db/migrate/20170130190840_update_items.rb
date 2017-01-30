class UpdateItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :size, :string, null: false
    add_column :items, :zip_code, :string, null: false
  end
end
