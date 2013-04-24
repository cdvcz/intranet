class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :registration_number
      t.string :registration_number_tax
      t.string :tax_registration
      t.string :email
      t.string :phone
      t.string :phone_cellular
      t.string :www
      t.timestamps
    end
  end
end
