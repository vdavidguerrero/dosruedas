class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name, unique: true, null: false
    end
    add_index :brands, :name
  end
end
