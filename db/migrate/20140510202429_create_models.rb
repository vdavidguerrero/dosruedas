class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name, unique: true, null: false
      t.references :brand
    end
    add_index :models, :name
  end
end
