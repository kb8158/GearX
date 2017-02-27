class ChangeItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :borrower_id
    add_column :items, :borrower_id, :integer, array: true, default: []
  end
end
