class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,      null: false
      t.string :last_name, null: false
      t.string :cellphone, null: false
      t.string :phone
      t.string :address
      t.string :email,     unique: true, null: false
      t.string :password,  limit: 25   , null: false
      t.references :city

      t.timestamps
    end
    add_index :users, :city_id
    add_index :users, :email
  end
end
