# encoding: utf-8
# author: mbach

class CreateContracts < ActiveRecord::Migration

  def change()
    create_table(:contracts) do |table|
      table.integer(:status)
      table.string(:number)
      table.text(:subject)
      table.integer(:tax_year)
      table.text(:description)
      table.date(:deadline_date)
      table.date(:end_date)
      table.text(:archiving)
      table.string(:role_type)
      table.string(:price_type)
      table.text(:invoicing_note)
      table.text(:note)

      table.timestamps()
    end
  end

end