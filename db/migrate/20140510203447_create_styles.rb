class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name,         unique: true, null: false
      t.string :photo_path,   unique: true, null: false
      t.string :description,  null: false
      t.references :type
    end
    add_index :styles, :name
  end
end
