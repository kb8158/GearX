class UpdateExchanges < ActiveRecord::Migration[5.0]
  def change
    add_column :exchanges, :element_id, :integer
    remove_column :exchanges, :selected
  end
end
