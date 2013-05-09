class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.integer :status
      t.string :number
      t.string :name
      t.integer :tax_year
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end