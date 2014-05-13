class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name, unique: true, null: false
    end
    add_index :types, :name
  end
end
