json.set! :meta do
  json.total_pages @employees.total_pages
  json.total_entries @employees.total_entries
end

json.set! :content do
  json.array!(@employees) do |json, employee|
    json.(employee, *employee.attributes.keys.map(&:to_sym))
    json.person employee.person.attributes
  end
end
