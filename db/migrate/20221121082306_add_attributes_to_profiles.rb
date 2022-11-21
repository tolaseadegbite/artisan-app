class AddAttributesToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :min_cost, :bigint
    add_column :profiles, :max_cost, :bigint
  end
end
