class UpdateBits < ActiveRecord::Migration[5.0]
  def change
    change_column_default :bits, :borrower_id, nil
  end
end
