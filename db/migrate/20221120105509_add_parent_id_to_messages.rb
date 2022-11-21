class AddParentIdToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :parent_id, :integer, null: true
  end
end
