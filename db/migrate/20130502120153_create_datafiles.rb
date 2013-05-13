# author: martinbachtikcdvcz

class CreateDatafiles < ActiveRecord::Migration

  def change
    create_table :datafiles do |t|
      t.string :name
      t.integer :status
      t.text :description
      t.string :filename
      t.string :extension
      t.integer :size
      t.text :path
      t.timestamps
    end
  end

end
