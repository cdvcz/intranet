class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :status
      t.string :number
      t.string :name
      t.string :name_en
      t.string :acronym
      t.date :date_from
      t.date :date_to
      t.timestamps
    end
  end
end
