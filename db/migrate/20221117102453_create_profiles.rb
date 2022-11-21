class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :artisan_id
      t.string :name
      t.text :about

      t.timestamps
    end
  end
end
