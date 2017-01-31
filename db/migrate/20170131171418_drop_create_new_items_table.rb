class DropCreateNewItemsTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :new_items_tables
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
