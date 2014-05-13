class ChangeTypeAds < ActiveRecord::Migration
  def change
    remove_column :ads, :strokes
    add_column :ads, :strokes, :integer
  end
end
