class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :status
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :title_prefix
      t.string :title_suffix
      t.integer :sex

      t.timestamps
    end
  end
end
