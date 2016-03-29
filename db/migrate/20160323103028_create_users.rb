class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.text :address
      t.string :contact_number

      t.timestamps null: false
    end
  end
end
