class UpdateBitsBorrower < ActiveRecord::Migration[5.0]
  def change
    remove_column :bits, :borrower_id
    add_column :bits, :borrower_id, :integer, default: nil
  end
end
