json.set! :meta do
  json.total_pages @resources.total_pages
  json.total_entries @resources.total_entries
end

json.set! :content do
  json.array!(@resources) do |json, project|
    json.(project, :id, :status, :number, :name, :name_en, :acronym, :date_from, :date_to)
  end
end