class ChangeEmployees < ActiveRecord::Migration
  def up
    add_column      :employees, :status, :integer, :after => :id
    add_column      :employees, :date_from, :date, :after => :status
    add_column      :employees, :date_to, :date, :after => :date_from

    remove_column   :employees, :first_name
    remove_column   :employees, :surname
    remove_column   :employees, :title_prefix
    remove_column   :employees, :title_suffix 
    remove_column   :employees, :number
    remove_column   :employees, :job
    remove_column   :employees, :email
    remove_column   :employees, :phone
    remove_column   :employees, :phone_cellular
    remove_column   :employees, :employed_from
    remove_column   :employees, :employed_to
    
  end

  def down
    add_column      :employees, :first_name, :string
    add_column      :employees, :surname, :string
    add_column      :employees, :title_prefix, :string
    add_column      :employees, :title_suffix, :string
    add_column      :employees, :number, :string
    add_column      :employees, :job, :string
    add_column      :employees, :email, :string
    add_column      :employees, :phone, :string
    add_column      :employees, :phone_cellular, :string
    add_column      :employees, :employed_from, :string
    add_column      :employees, :employed_to, :string

    remove_column   :employees, :status
    remove_column   :employees, :date_from
    remove_column   :employees, :date_to
  end
end
