json.set! :meta do
  json.total_pages @resources.total_pages
  json.total_entries @resources.total_entries
end

json.set! :content do
  json.array!(@resources) do |json, employee|
    json.(employee, :id, :first_name, :surname, :job)
  end
end
