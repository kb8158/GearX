class DropExchangesTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :exchanges
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
