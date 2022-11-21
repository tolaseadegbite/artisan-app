class CreateArtisans < ActiveRecord::Migration[7.0]
  def change
    create_table :artisans do |t|
      t.string :name
      t.text :description
      t.string :slug

      t.timestamps
    end
    add_index :artisans, :slug, unique: true
  end
end
