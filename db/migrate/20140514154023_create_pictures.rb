class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    t.string :path , unique: true, null: false
    t.string :descripcion
    t.references :ad, null:false
    end
  end
end
