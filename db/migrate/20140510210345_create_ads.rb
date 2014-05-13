class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.integer    :price
      t.integer    :year
      t.integer    :visit_count
      t.integer    :gears
      t.integer    :engine_size
      t.integer    :cylinders

      t.boolean    :strokes

      t.string     :paper_status
      t.string     :color
      t.string     :transmission_type
      t.string     :description

      t.references :vehicle
      t.references :user

      t.timestamps
    end
    add_index :ads, :user_id
    add_index :ads, :vehicle_id
  end
end
