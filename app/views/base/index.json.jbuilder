json.set! :meta do
  json.total_pages @resources.total_pages
  json.total_entries @resources.total_entries
end

json.set! :content do
  json.array!(@resources) do |json, resource|
    render partial: 'base/resource', locals: { json: json, resource: resource }
  end
end

