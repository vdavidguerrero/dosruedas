class ChangeTypeAds < ActiveRecord::Migration
  def change
    change_column :ads, :strokes   , :int
  end
end
