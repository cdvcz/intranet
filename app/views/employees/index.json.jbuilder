json.set! :meta do
  json.total_pages @employees.total_pages
  json.total_entries @employees.total_entries
end

json.set! :content do
  json.array!(@employees) do |json, employee|
    json.(employee, :id, :first_name, :surname, :job)
  end
end
