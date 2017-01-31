class UpdateSelectedColumnExchanges < ActiveRecord::Migration[5.0]
  def change
    add_column :exchanges, :selected, :boolean, default: false
  end
end
