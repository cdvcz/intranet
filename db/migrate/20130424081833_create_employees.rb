class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :number
      t.string :first_name
      t.string :surname
      t.string :title_prefix
      t.string :title_suffix
      t.string :job
      t.string :email
      t.string :phone
      t.string :phone_cellular
      t.string :employed_from
      t.string :employed_to
      t.timestamps
    end
  end
end
